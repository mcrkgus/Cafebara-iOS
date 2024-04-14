//
//  RoutineCollectionHeaderView.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/8/24.
//

import UIKit

import SnapKit
import Then

final class RoutineCollectionHeaderView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    
    // MARK: - Properties
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    let addRoutineView = UIView()
    private let addRoutineImageView = UIImageView()
    private let addRoutineLabel = UILabel()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension RoutineCollectionHeaderView {
    
    func setUI() {
        backgroundColor = .clear
    }
    
    func setStyle() {
        addRoutineView.do {
            $0.backgroundColor = .clear
        }
        
        addRoutineImageView.do {
            $0.image = UIImage(resource: .icLargeBtnAdd18)
        }
        
        addRoutineLabel.do {
            $0.text = I18N.Routine.addRoutineLabel
            $0.font = .fontBara(.body2)
            $0.asLineHeight(.body2)
            $0.textColor = .blueBara
        }
    }
    
    func setHierarchy() {
        addSubview(addRoutineView)
        addRoutineView.addSubviews(addRoutineImageView,
                                   addRoutineLabel)
    }
    
    func setLayout() {
        addRoutineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(34)
            $0.width.equalTo(63)
        }
        
        addRoutineImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(16)
        }
        
        addRoutineLabel.snp.makeConstraints {
            $0.leading.equalTo(addRoutineImageView.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
    }
}

extension RoutineCollectionHeaderView {
}
