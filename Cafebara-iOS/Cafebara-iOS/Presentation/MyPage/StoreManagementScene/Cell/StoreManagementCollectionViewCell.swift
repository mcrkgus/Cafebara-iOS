//
//  StoreManagementCollectionViewCell.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/30/24.
//

import UIKit

import SnapKit
import Then
import RxSwift

final class StoreManagementCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static let identifier = "StoreManagementCollectionViewCell"
    static let isFromNib: Bool = false
    var isOwner: Bool = false
    var disposeBag = DisposeBag()
    var buttonTappedClosure: (() -> Void)?
    
    // MARK: - UI Components

    private let contentsView = UIView()
    private let storeButton = UIButton()
    private let storeIconImage = UIImageView()
    private let storeNameLabel = UILabel()
    private let joinDateLabel = UILabel()
    private let swungDashLabel = UILabel()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension StoreManagementCollectionViewCell {
    
    func setUI() {
        backgroundColor = .clear
        isUserInteractionEnabled = true
    }
    
    func setStyle() {
        contentsView.do {
            $0.backgroundColor = .whiteBara
            $0.setRoundBorder(borderColor: .gray1, borderWidth: 1, cornerRadius: 8)
        }
        
        storeIconImage.do {
            $0.image = .baratte
            $0.contentMode = .scaleAspectFit
        }
        
        storeNameLabel.do {
            $0.text = "티니핑핑이카페"
            //TODO: 서버통신시 업장 이름 받아오기
            $0.textColor = .gray7
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
        }
        
        joinDateLabel.do {
            $0.text = "2019.03.01"
            //TODO: 서버통신시 입사 날짜 받아오기
            $0.textColor = .gray2
            $0.font = .fontBara(.caption2)
            $0.asLineHeight(.caption2)
        }
        
        swungDashLabel.do {
            $0.text = I18N.StoreManagement.swungDash
            $0.textColor = .gray2
            $0.font = .fontBara(.caption2)
            $0.asLineHeight(.caption2)
        }
    }
    
    func setHierarchy() {
        addSubviews(contentsView)
        contentsView.addSubviews(storeIconImage,
                                 storeNameLabel,
                                 joinDateLabel,
                                 swungDashLabel)
    }
    
    func setLayout() {
        contentsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        storeIconImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.bottom.equalToSuperview().inset(39)
            $0.leading.equalTo(storeIconImage.snp.trailing).offset(11)
        }
        
        joinDateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(46)
            $0.bottom.equalToSuperview().inset(23)
            $0.leading.equalTo(storeIconImage.snp.trailing).offset(11)
        }
        
        swungDashLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(46)
            $0.bottom.equalToSuperview().inset(23)
            $0.leading.equalTo(joinDateLabel.snp.trailing)
        }
    }
}

extension StoreManagementCollectionViewCell {
    
    func configureCell(data: StoreManagementInfo, isSelected: Bool) {
        storeNameLabel.text = data.storeName
        joinDateLabel.text = convertToDateStr(dateComponents: data.date)
        updateUI(isSelected: isSelected)
    }
    
    func updateUI(isSelected: Bool) {
        if isSelected {
            contentsView.do {
                $0.backgroundColor = .blue10
                $0.setRoundBorder(borderColor: .blueBara, borderWidth: 1, cornerRadius: 8)
            }
            storeNameLabel.do {
                $0.textColor = .blueBara
            }
        } else {
            contentsView.do {
                $0.backgroundColor = .whiteBara
                $0.setRoundBorder(borderColor: .gray1, borderWidth: 1, cornerRadius: 8)
            }
            storeNameLabel.do {
                $0.textColor = .black            }
        }
    }
}
