//
//  StaffMissionCollectionCollectionViewCell.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/2/24.
//

import UIKit

import SnapKit
import Then

final class StaffMissionCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
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

private extension StaffMissionCollectionViewCell {

    func setUI() {
        
    }

    func setStyle() {
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
}

extension StaffMissionCollectionViewCell {

    func configureCell() {
        
    }
}
