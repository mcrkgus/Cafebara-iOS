//
//  RoutineView.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/8/24.
//

import UIKit

import SnapKit
import Then

final class RoutineView: UIView {
    
    // MARK: - UI Components
    
    let navigationBar = CustomNavigationView()
    private let noRoutineImageView = UIImageView()
    private let noRoutineLabel = UILabel()
    let routineCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let alertview = CustomAlertView(type: .medium,
                                    title: I18N.Routine.routineDeleteAlertTitle,
                                    subTitle: "")
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension RoutineView {
    
    func setUI() {
        backgroundColor = .backgroundBara
    }
    
    func setStyle() {
        navigationBar.do {
            $0.isBackButtonIncluded = true
            $0.isTitleLabelIncluded = true
            $0.titleLabelText = I18N.Routine.routineNavigationTitle
        }
        
        noRoutineImageView.do {
            $0.image = UIImage(resource: .logInImage1) // TODO: 이미지 추후 수정
        }
        
        noRoutineLabel.do {
            $0.font = .fontBara(.body1)
            $0.asLineHeight(.body1)
            $0.textColor = .gray4
            $0.text = I18N.Routine.noRoutineLabel
        }
        
        routineCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 6.0
            layout.headerReferenceSize = CGSize(width: SizeLiterals.Screen.screenWidth, height: 44)
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0)
            
            $0.collectionViewLayout = layout
            $0.contentInsetAdjustmentBehavior = .always
            $0.backgroundColor = .backgroundBara
            $0.showsVerticalScrollIndicator = false
        }
        
        alertview.do {
            $0.isHidden = true
        }
    }
    
    func setHierarchy() {
        addSubviews(navigationBar,
                    noRoutineImageView,
                    noRoutineLabel,
                    routineCollectionView,
                    alertview)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        noRoutineImageView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(111)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(155)
        }
        
        noRoutineLabel.snp.makeConstraints {
            $0.top.equalTo(noRoutineImageView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        routineCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        alertview.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setRegisterCell() {
        RoutineCollectionHeaderView.register(target: routineCollectionView)
        RoutineCollectionViewCell.register(target: routineCollectionView)
    }
}
