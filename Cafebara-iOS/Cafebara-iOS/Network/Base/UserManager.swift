//
//  UserManager.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 4/11/24.
//

import Foundation
import Moya

class UserManager {
    static let shared = UserManager()

    private init() {}

    /// UserDefaults에 저장할 키 값
    private let userIdentifierKey = "userIdentifier"
    private let userNameKey = "userName"
    private let userEmailKey = "userEmail"
    private let userTokenKey = "userToken"
    private let accessTokenKey = "accessToken"
    private let refreshTokenKey = "refreshToken"
    
    private var authProvider = BaraProviders.authProvider
    public var accessToken: String? {
        get { UserDefaults.standard.string(forKey: accessTokenKey) }
        set { UserDefaults.standard.set(newValue, forKey: accessTokenKey) }
    }
    
    public var refreshToken: String? {
        get { UserDefaults.standard.string(forKey: refreshTokenKey) }
        set { UserDefaults.standard.set(newValue, forKey: refreshTokenKey) }
    }
    /// 사용자 정보 저장
    func saveUser(loginData: LoginData) {
        UserDefaults.standard.set(loginData.userIdentifier, forKey: userIdentifierKey)
        UserDefaults.standard.set(loginData.userName, forKey: userNameKey)
        UserDefaults.standard.set(loginData.userEmail, forKey: userEmailKey)
        UserDefaults.standard.set(loginData.token, forKey: userTokenKey)
    }

    /// 사용자 정보 로드
    var currentUser: LoginData? {
        guard let userIdentifier = UserDefaults.standard.string(forKey: userIdentifierKey),
              let userName = UserDefaults.standard.string(forKey: userNameKey),
              let userEmail = UserDefaults.standard.string(forKey: userEmailKey),
              let token = UserDefaults.standard.string(forKey: userTokenKey) else {
            return nil
        }
        
        return LoginData(userIdentifier: userIdentifier, userName: userName, userEmail: userEmail, token: token)
    }

    /// 로그아웃 처리
    func logout() {
        UserDefaults.standard.removeObject(forKey: userIdentifierKey)
        UserDefaults.standard.removeObject(forKey: userNameKey)
        UserDefaults.standard.removeObject(forKey: userEmailKey)
        UserDefaults.standard.removeObject(forKey: userTokenKey)
    }
    
    ///토큰 갱신 처리
    func getNewToken(completion: @escaping(Result<Bool, Error>) -> Void) {
        authProvider.request(.getNewToken) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                //TODO: 토큰 갱신 로직 구현
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct LoginData {
    let userIdentifier: String
    let userName: String?
    let userEmail: String?
    let token: String
}
