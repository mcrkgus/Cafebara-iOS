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
    private var noticeData: [NoticeInfo] = []

    // MARK: - UI Components
    
    let navigationBar = CustomNavigationView()
    private let noticeTitleLabel = UILabel()
    let noticeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let noNoticeImage = UIImageView()
    private let noNoticeLabel = UILabel()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
        updateCollectionView()
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
        
        noticeCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.scrollDirection = .vertical
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
            layout.collectionView?.isScrollEnabled = true
            $0.collectionViewLayout = layout
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        noNoticeImage.do {
            $0.image = UIImage(resource: .notice)
            //TODO: 추후 이미지 수정 예정
            $0.contentMode = .scaleAspectFit
            $0.isHidden = true
        }
        
        noNoticeLabel.do {
            $0.text = I18N.Notice.noNoticeLabel
            $0.font = .fontBara(.body1)
            $0.asLineHeight(.body1)
            $0.textColor = .gray4
            $0.isHidden = true
        }
    }
    
    func setHierarchy() {
        
        addSubviews(navigationBar,
                    noticeCollectionView,
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
        
        noticeCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func updateCollectionView() {
        noticeCollectionView.isHidden = noticeData.isEmpty
        noNoticeImage.isHidden = !noticeData.isEmpty
        noNoticeLabel.isHidden = !noticeData.isEmpty
    }
    
    func setRegisterCell() {
        
        NoticeCollectionViewCell.register(target: noticeCollectionView)
    }
}
