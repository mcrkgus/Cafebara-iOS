//
//  LoginViewController.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 3/13/24.
//

import UIKit

import AuthenticationServices
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let loginView = LoginView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        setTarget()
    }
}

// MARK: - Extensions

extension LoginViewController {
    func bindViewModel() {
        viewModel.outputs.imageData
            .bind(to: loginView.loginCollectionView.rx
                .items(cellIdentifier: LoginCollectionViewCell.className,
                       cellType: LoginCollectionViewCell.self)) { (_, model, cell) in
                cell.configureCell(model: model)
            }
            .disposed(by: disposeBag)
    }
    
    func setTarget() {
        loginView.loginButton.addTarget(self, action: #selector(tapAppleLogin), for: .touchUpInside)
    }
    
    @objc func tapAppleLogin() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    /// 성공한 경우
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            switch authorization.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                let userIdentifier = appleIDCredential.user
                let fullName = [appleIDCredential.fullName?.familyName, appleIDCredential.fullName?.givenName]
                    .compactMap { $0 }
                    .joined()
                let email = appleIDCredential.email ?? "No Email"
                
                if  let authorizationCode = appleIDCredential.authorizationCode,
                    let identityToken = appleIDCredential.identityToken,
                    let authCodeString = String(data: authorizationCode, encoding: .utf8),
                    let identifyTokenString = String(data: identityToken, encoding: .utf8) {
                    print("authorizationCode: \(authorizationCode)")
                    print("identityToken: \(identityToken)")
                    print("authCodeString: \(authCodeString)")
                    print("identifyTokenString: \(identifyTokenString)")
                }
                
                /// UserManager를 사용하여 사용자 정보 저장
                let identityTokenString = String(data: appleIDCredential.identityToken!, encoding: .utf8) ?? ""
                let loginData = LoginData(userIdentifier: appleIDCredential.user,
                                          userName: fullName.isEmpty ? nil : fullName,
                                          userEmail: email != "No Email" ? email : nil,
                                          token: identityTokenString)
                UserManager.shared.saveUser(loginData: loginData)
                
                //TODO: ViewModel에 로그인 성공을 알림
                print(fullName + ", email: " + email)
                print("🍎🍎🍎🍎🍎🍎🍎🍎")
                viewModel.inputs.handleAppleLoginSuccess(appleIDCredential.user)
                //TODO: 온보딩 페이지로 이동
                
            default:
                break
            }
        }
        
        /// 실패한 경우
        func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
            //TODO: 에러 처리
            //TODO: ViewModel에 로그인 실패를 알림
            viewModel.inputs.handleAppleLoginFailure(error)
        }
    }
}
