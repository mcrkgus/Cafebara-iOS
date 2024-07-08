//
//  StoreManagementViewController.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/30/24.
//

import UIKit

import RxCocoa
import RxDataSources
import RxSwift

final class StoreManagementViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = StoreManagementViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let storeManagementView = StoreManagementView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = storeManagementView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setGesture()
        bindViewModel()
        setDelegate()
    }
}

// MARK: - Extensions

extension StoreManagementViewController: UICollectionViewDelegateFlowLayout {
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
        storeManagementView.navigationBar.backButtonAction = {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setGesture() {
        //TODO: 업장 선택 동작 구현 예정
    }
    
    func bindViewModel() {
        let dataSource = RxCollectionViewSectionedReloadDataSource<StoreInfoSection>(
            configureCell: { (_, collectionView, indexPath, item) in
                let cell = StoreManagementCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
                cell.configureCell(data: item, isSelected: false)
                
                return cell
            },
            configureSupplementaryView: { (dataSource, collectionView, _, indexPath) in
                let headerView = StoreManagementCollectionHeaderView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
                
                return headerView
            }
        )
        
        viewModel.outputs.storeManageInfo
            .bind(to: storeManagementView.storeManageCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        viewModel.selectedIndexPath
            .subscribe(onNext: { [weak self] indexPath in
                self?.storeManagementView.storeManageCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    func setDelegate() {
        storeManagementView.storeManageCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        storeManagementView.storeManageCollectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.viewModel.selectedIndexPath.accept(indexPath)
            })
            .disposed(by: disposeBag)
    }
}
