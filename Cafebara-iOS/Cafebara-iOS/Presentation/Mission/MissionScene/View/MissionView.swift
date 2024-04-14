//
//  MissionView.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/1/24.
//

import UIKit

import SnapKit
import Then

final class MissionView: UIView {
    
    // MARK: - UI Components
    
    let navigationBar = CustomNavigationView()
    private let routineImageView = UIImageView()
    private let routineLabel = UILabel()
    let routineButton = UIButton()
    let staffMissionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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

private extension MissionView {
    
    func setUI() {
        backgroundColor = .backgroundBara
    }
    
    func setStyle() {
        navigationBar.do {
            $0.isTitleLabelIncluded = true
            $0.isModifyButtonIncluded = true
            $0.titleLabelText = I18N.Mission.missionNavigationTitle
        }
        
        routineImageView.do {
            $0.image = UIImage(resource: .graphicSpeechBubble)
            $0.isUserInteractionEnabled = true
        }
        
        if SizeLiterals.Screen.deviceRatio > 0.5 {
            routineLabel.do {
                $0.text = I18N.Mission.routineTitle
                $0.font = .fontBara(.caption2)
                $0.asLineHeight(.caption2)
                $0.textColor = .gray3
            }
        } else {
            routineLabel.do {
                $0.text = I18N.Mission.routineTitle
                $0.font = .fontBara(.body4)
                $0.asLineHeight(.body4)
                $0.textColor = .gray3
            }
        }
        
        routineButton.do {
            $0.setImage(.icSpeechBubbleDelete16Gray3, for: .normal)
        }
        
        staffMissionCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 11.0
            layout.itemSize = CGSize(width: SizeLiterals.Screen.screenWidth - 40, height: 88)
            layout.headerReferenceSize = CGSize(width: SizeLiterals.Screen.screenWidth, height: 34)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 34, right: 0)
            
            $0.collectionViewLayout = layout
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    func setHierarchy() {
        addSubviews(navigationBar,
                    staffMissionCollectionView,
                    routineImageView)
        
        routineImageView.addSubviews(routineLabel,
                                     routineButton)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        if SizeLiterals.Screen.deviceRatio > 0.5 {
            routineImageView.snp.makeConstraints {
                $0.top.equalTo(navigationBar).offset(49)
                $0.trailing.equalToSuperview().inset(10)
                $0.width.equalTo(169)
                $0.height.equalTo(34)
            }
            
            routineLabel.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(9)
                $0.leading.equalToSuperview().offset(8)
            }
            
            routineButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(7)
                $0.trailing.equalToSuperview().inset(6)
                $0.size.equalTo(16)
            }
        } else {
            routineImageView.snp.makeConstraints {
                $0.top.equalTo(navigationBar).offset(49)
                $0.trailing.equalToSuperview().inset(10)
                $0.width.equalTo(193)
                $0.height.equalTo(40)
            }
            
            routineLabel.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(8)
                $0.leading.equalToSuperview().offset(8)
            }
            
            routineButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(9)
                $0.trailing.equalToSuperview().inset(6)
                $0.size.equalTo(16)
            }
        }
        
        staffMissionCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setRegister() {
        StaffMissionCollectionHeaderView.register(target: staffMissionCollectionView)
        StaffMissionCollectionViewCell.register(target: staffMissionCollectionView)
    }
}

extension MissionView {
    
    func setHiddenRoutineInfo() {
        routineImageView.isHidden = true
    }
}
