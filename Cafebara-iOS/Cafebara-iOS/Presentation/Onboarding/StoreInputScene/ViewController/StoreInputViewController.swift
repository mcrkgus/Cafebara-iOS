//
//  StoreInputViewController.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 3/17/24.
//

import UIKit

import RxSwift
import RxCocoa
import RxGesture

final class StoreInputViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: OnboardingRegisterViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let storeInputView = StoreInputView()
    
    // MARK: - Life Cycles
    
    init(viewModel: OnboardingRegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = storeInputView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        bindViewModel()
    }
}

// MARK: - Extensions

extension StoreInputViewController {

    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.storeInputView.navigationBar.backButtonAction = {
            self.navigationController?.popViewController(animated: true)
        }
    }

    func bindViewModel() {
        storeInputView.nextButton.rx.tap
            .bind {
                if let storeText = self.storeInputView.storeInputTextField.text {
                    self.viewModel.inputs.saveStore(store: storeText)
                }
                let nav = InviteCodeViewController(viewModel: self.viewModel)
                self.navigationController?.pushViewController(nav, animated: true)
            }
            .disposed(by: disposeBag)
        
        storeInputView.rx.tapGesture()
            .when(.recognized)
            .bind { _ in
                self.storeInputView.endEditing(true)
            }
            .disposed(by: disposeBag)
    }
}
