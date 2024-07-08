//
//  StoreManagementView.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/30/24.
//

import UIKit

import SnapKit
import Then

final class StoreManagementView: UIView {

    // MARK: - UI Components
    let navigationBar = CustomNavigationView()
    let storeManageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let exitButton = CustomButton(status: false, type: .noBorder, title: I18N.StoreManagement.exitStoreButtonTitle)
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
        setRegister()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension StoreManagementView {
    
    func setUI() {
        backgroundColor = .backgroundBara
    }
    
    func setStyle() {
        navigationBar.do {
            $0.isTitleLabelIncluded = true
            $0.isBackButtonIncluded = true
            $0.titleLabelText = I18N.StoreManagement.exitStoreTitle
        }
        
        storeManageCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 12
            layout.scrollDirection = .vertical
            layout.headerReferenceSize = CGSize(width: SizeLiterals.Screen.screenWidth, height: 64)
            layout.itemSize = CGSize(width: SizeLiterals.Screen.screenWidth - 40, height: 82)
            $0.collectionViewLayout = layout
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
        }
    }
    
    func setHierarchy() {
        addSubviews(navigationBar,
                    storeManageCollectionView,
                    exitButton)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide)
        }
        
        storeManageCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(exitButton.snp.top).offset(-26)
        }
        
        exitButton.snp.makeConstraints {
            $0.top.equalTo(storeManageCollectionView.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-22)
        }
    }
    
    func setRegister() {
        StoreManagementCollectionHeaderView.register(target: storeManageCollectionView)
        StoreManagementCollectionViewCell.register(target: storeManageCollectionView)
    }
}
