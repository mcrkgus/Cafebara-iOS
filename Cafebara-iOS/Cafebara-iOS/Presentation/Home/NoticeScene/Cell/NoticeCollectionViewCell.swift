//
//  NoticeCollectionViewCell.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/8/24.
//

import UIKit

import SnapKit
import Then

final class NoticeCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties

    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    
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

private extension NoticeCollectionViewCell {

    func setUI() {
        
    }

    func setStyle() {
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
}

extension NoticeCollectionViewCell {

    func configureCell() {
        
    }
}
