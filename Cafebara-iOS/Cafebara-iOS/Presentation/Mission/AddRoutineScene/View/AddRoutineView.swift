//
//  AddRoutineView.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/15/24.
//

import UIKit

import SnapKit
import Then

final class AddRoutineView: UIView {
    
    // MARK: - UI Components
    
    let navigationBar = CustomNavigationView()
    private let workTitleLabel = UILabel()
    private let workManualImageView = UIImageView()
    private let workManualLabel = UILabel()
    let routineKeywordFixButton = UIButton()
    let routineKeyworkCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let routineCategoryLabel = UILabel()
    let routineTodoTextView = UITextView()
    let routineTodoTextViewClearButton = UIButton()
    let changeButton = CustomButton(status: false,
                                 type: .noBorder,
                                 title: I18N.AddRoutine.changeAddButtonTitle)
    
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

private extension AddRoutineView {
    
    func setUI() {
        backgroundColor = .backgroundBara
    }
    
    func setStyle() {
        navigationBar.do {
            $0.isBackButtonIncluded = true
            $0.isTitleLabelIncluded = true
            $0.titleLabelText = I18N.AddRoutine.addRoutineNavigationTitle
        }
        
        workTitleLabel.do {
            $0.text = I18N.AddRoutine.workTitleLabel
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
            $0.textColor = .gray5
        }
        
        workManualImageView.do {
            $0.image = UIImage(resource: .icInfoWorklabel14)
        }
        
        workManualLabel.do {
            $0.text = I18N.AddRoutine.workManualLabel
            $0.font = .fontBara(.caption2)
            $0.asLineHeight(.caption2)
            $0.textColor = .gray2
        }
        
        routineKeywordFixButton.do {
            $0.setImage(UIImage(resource: .icNaviModify), for: .normal)
        }
        
        routineKeyworkCollectionView.do {
            let layout = LeftAlignedCollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 10.0
            layout.minimumInteritemSpacing = 8.0
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            
            $0.collectionViewLayout = layout
            $0.contentInsetAdjustmentBehavior = .always
            $0.backgroundColor = .backgroundBara
            $0.showsVerticalScrollIndicator = false
        }
        
        routineCategoryLabel.do {
            $0.text = I18N.AddRoutine.routineCategoryLabel
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
            $0.textColor = .gray5
        }
        
        routineTodoTextView.do {
            $0.backgroundColor = .whiteBara
            $0.setRoundBorder(borderColor: .gray1,
                              borderWidth: 1.0,
                              cornerRadius: 8)
            $0.textContainerInset = UIEdgeInsets(top: 16,
                                                 left: 16,
                                                 bottom: 16,
                                                 right: 16)
            $0.text = I18N.AddRoutine.routineTodoTextViewPlaceholder
            $0.font = .fontBara(.body3)
            $0.textColor = .gray2
            $0.isScrollEnabled = false
            $0.sizeToFit()
        }
        
        routineTodoTextViewClearButton.do {
            $0.setImage(UIImage(resource: .icTextDeleteCircle), for: .normal)
        }
    }
    
    func setHierarchy() {
        addSubviews(navigationBar,
                    workTitleLabel,
                    workManualImageView,
                    workManualLabel,
                    routineKeywordFixButton,
                    routineKeyworkCollectionView,
                    routineCategoryLabel,
                    routineTodoTextView,
                    routineTodoTextViewClearButton,
                    changeButton)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        workTitleLabel.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(20)
        }
        
        workManualImageView.snp.makeConstraints {
            $0.top.equalTo(workTitleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(14)
        }
        
        workManualLabel.snp.makeConstraints {
            $0.centerY.equalTo(workManualImageView)
            $0.leading.equalTo(workManualImageView.snp.trailing).offset(2)
        }
        
        routineKeywordFixButton.snp.makeConstraints {
            $0.centerY.equalTo(workTitleLabel)
            $0.trailing.equalToSuperview().inset(20)
            $0.size.equalTo(16)
        }
        
        routineKeyworkCollectionView.snp.makeConstraints {
            $0.top.equalTo(workTitleLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(74) // TODO: 이후 수정
        }
        
        routineCategoryLabel.snp.makeConstraints {
            $0.top.equalTo(routineKeyworkCollectionView.snp.bottom).offset(48)
            $0.leading.equalToSuperview().inset(20)
        }
        
        routineTodoTextView.snp.makeConstraints {
            $0.top.equalTo(routineCategoryLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        routineTodoTextViewClearButton.snp.makeConstraints {
            $0.centerY.equalTo(routineTodoTextView)
            $0.trailing.equalTo(routineTodoTextView).inset(16)
            $0.size.equalTo(24)
        }
        
        changeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-14)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setRegisterCell() {
        RoutineKeywordCollectionViewCell.register(target: routineKeyworkCollectionView)
    }
}

extension AddRoutineView {
    
    func configureView() {
        
    }
}
