//
//  NoticeViewController.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/8/24.
//

import UIKit

import RxCocoa
import RxDataSources
import RxSwift

final class NoticeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = NoticeViewModel()
    private let disposeBag = DisposeBag()
    
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
    }
}

// MARK: - Extensions

extension NoticeViewController {

    func setUI() {
        
        self.navigationController?.navigationBar.isHidden = true
        noticeView.navigationBar.backButtonAction = {
            self.navigationController?.popViewController(animated: true)
        }
    }

    func bindViewModel() {
        
        viewModel.outputs.noticeInfoData
            .bind(to: noticeView.noticeCollectionView.rx
                .items(cellIdentifier: NoticeCollectionViewCell.className,
                       cellType: NoticeCollectionViewCell.self)) { (_, model, cell) in
                cell.configureCell(data: model)
            }
            .disposed(by: disposeBag)
    }
}
