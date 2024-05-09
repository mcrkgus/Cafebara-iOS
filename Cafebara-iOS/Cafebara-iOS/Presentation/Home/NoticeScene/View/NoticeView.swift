//
//  NoticeView.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/8/24.
//

import UIKit

import SnapKit
import Then

final class NoticeView: UIView {

    // MARK: - Properties
    var isOnwer = false
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationView()
    private let noticeTitleLabel = UILabel()
    private let ownerNoticeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let staffNoticeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let noNoticeImage = UIImageView()
    private let noNoticeLabel = UILabel()
    
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

private extension NoticeView {

    func setUI() {
        backgroundColor = .backgroundBara
    }

    func setStyle() {
        navigationBar.do {
            $0.isTitleLabelIncluded = true
            $0.isBackButtonIncluded = true
            $0.titleLabelText = I18N.Notice.noticeNavigationTitle
        }
        
        noticeTitleLabel.do {
            $0.text = I18N.Notice.noticeNavigationTitle
            $0.textColor = .gray7
            $0.textAlignment = .center
            $0.font = .fontBara(.heading)
            $0.asLineHeight(.heading)
        }
        
        noNoticeImage.do {
            $0.image = UIImage(resource: .notice)
            //TODO: 추후 이미지 수정 예정
            $0.contentMode = .scaleAspectFit
            $0.isHidden = false
        }
        
        noNoticeLabel.do {
            $0.text = I18N.Notice.noNoticeLabel
            $0.font = .fontBara(.body1)
            $0.asLineHeight(.body1)
            $0.textColor = .gray4
            $0.isHidden = false
        }
    }
    
    func setHierarchy() {
        addSubviews(navigationBar,
                    noNoticeImage,
                    noNoticeLabel)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide)
        }
        
        noNoticeImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(navigationBar.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 125 / 667)
        }
        
        noNoticeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(noNoticeImage.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 24 / 667)
        }
    }
    
    func setRegisterCell() {
        
    }
}

extension NoticeView {

    func configureView() {
        
    }
}
