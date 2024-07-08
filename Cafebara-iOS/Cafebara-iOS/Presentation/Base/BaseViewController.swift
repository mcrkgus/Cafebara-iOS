//
//  BaseViewController.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 7/4/24.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    let disposeBag = DisposeBag()
    
    // MARK: - Life Cycles
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindViewModel()
    }
    
    // MARK: - Setup Methods
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func bindViewModel() {
    
    }
}
