//
//  HomeNoticeCollectionViewCell.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/8/24.
//

import UIKit

import SnapKit
import Then

final class HomeNoticeCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties

    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let noticeIconImageView = UIImageView()
    private let noticeChipLabel = UILabel()
    private let noticeTitleLabel = UILabel()
    private let noticeEmptyTitleLabel = UILabel()
    private let noticeMoreButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension HomeNoticeCollectionViewCell {

    func setUI() {
        self.do {
            $0.backgroundColor = .whiteBara
            $0.setRoundBorder(borderColor: .gray1, borderWidth: 1, cornerRadius: 10)
        }
    }
    
    func setStyle() {
        noticeChipLabel.do {
            $0.textColor = .whiteBara
            $0.textAlignment = .center
            $0.font = .fontBara(.caption2)
            $0.asLineHeight(.caption2)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
        }
        
        noticeTitleLabel.do {
            $0.textColor = .gray7
            $0.textAlignment = .left
            $0.font = .fontBara(.body4)
            $0.asLineHeight(.body4)
        }
        
        noticeEmptyTitleLabel.do {
            $0.text = I18N.Home.noticeEmptyTitle
            $0.textColor = .gray3
            $0.textAlignment = .left
            $0.font = .fontBara(.body4)
            $0.asLineHeight(.body4)
            $0.isHidden = true
        }
        
        noticeMoreButton.do {
            $0.setImage(.icArrowRight24, for: .normal)
        }
    }
    
    func setHierarchy() {
        addSubviews(noticeIconImageView, noticeChipLabel, noticeTitleLabel, noticeEmptyTitleLabel, noticeMoreButton)
    }
    
    func setLayout() {
        noticeIconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(28)
        }
        
        noticeChipLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalTo(noticeIconImageView.snp.trailing).offset(12)
            $0.width.equalTo(40)
            $0.height.equalTo(16)
        }
        
        noticeTitleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(14)
            $0.leading.equalTo(noticeChipLabel.snp.leading)
        }
        
        noticeEmptyTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(noticeIconImageView.snp.trailing).offset(12)
            $0.centerY.equalToSuperview()
        }
        
        noticeMoreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
}

extension HomeNoticeCollectionViewCell {

    func configureCell(model: CafeNoticeDto) {
        self.setStyle()
        noticeTitleLabel.text = model.noticeTitle
        noticeChipLabel.text = model.noticeType
        
        switch model.noticeType {
        case "일반":
            noticeIconImageView.image = .icNoticeDarkgray
            noticeChipLabel.backgroundColor = .gray2
        case "필독":
            noticeIconImageView.image = .icNoticeOrange
            noticeChipLabel.backgroundColor = .orangeBara
        default:
            break
        }
    }
}
