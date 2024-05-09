//
//  NoticeViewController.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/8/24.
//

import UIKit

final class NoticeViewController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let noticeView = NoticeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = noticeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        bindViewModel()
        setDelegate()
    }
}

// MARK: - Extensions

extension NoticeViewController {

    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }

    func bindViewModel() {
	
    }
    
    func setDelegate() {
        
    }
}
