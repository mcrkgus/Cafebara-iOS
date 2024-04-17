//
//  AddRoutineKeywordCollectionViewCell.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/16/24.
//

import UIKit

import SnapKit
import Then

final class RoutineKeywordCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let backGroundView = UIView()
    private let routineKeywordLabel = CustomPaddingLabel(padding: UIEdgeInsets(top: 6, left: 14, bottom: 6, right: 14))
    
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

private extension RoutineKeywordCollectionViewCell {
    
    func setUI() {
        
    }
    
    func setStyle() {
        routineKeywordLabel.do {
            $0.font = .fontBara(.body2)
            $0.asLineHeight(.body2)
            $0.layer.cornerRadius = 24
            $0.layer.masksToBounds = true
        }
    }
    
    func setHierarchy() {
        addSubview(backGroundView)
        backGroundView.addSubview(routineKeywordLabel)
    }
    
    func setLayout() {
        routineKeywordLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension RoutineKeywordCollectionViewCell {
    
    func configureCell() {
        
    }
}
