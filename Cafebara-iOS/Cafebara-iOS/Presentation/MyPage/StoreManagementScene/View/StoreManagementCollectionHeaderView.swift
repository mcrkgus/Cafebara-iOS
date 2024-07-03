//
//  StoreManagementHeaderView.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 6/6/24.
//

import UIKit

import SnapKit
import Then

final class StoreManagementCollectionHeaderView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    
    // MARK: - Properties
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let exitStoreExplanationLabel = UILabel()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension StoreManagementCollectionHeaderView {
    
    func setUI() {
        backgroundColor = .clear
    }
    
    func setStyle() {
        exitStoreExplanationLabel.do {
            $0.text = I18N.StoreManagement.exitStoreExplanation
            $0.textColor = .gray2
            $0.font = .fontBara(.title3)
        }
    }
    
    func setHierarchy() {
        addSubview(exitStoreExplanationLabel)
    }
    
    func setLayout() {
        exitStoreExplanationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalToSuperview()
        }
    }
}
