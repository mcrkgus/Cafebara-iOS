//
//  StaffMissionCollectionHeaderView.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/2/24.
//

import UIKit

import SnapKit
import Then

final class StaffMissionCollectionHeaderView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    
    // MARK: - Properties
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let dateLabel = UILabel()
    
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

private extension StaffMissionCollectionHeaderView {
    
    func setUI() {
        backgroundColor = .clear
    }
    
    func setStyle() {
        dateLabel.do {
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
            $0.textColor = .gray2
        }
    }
    
    func setHierarchy() {
        addSubview(dateLabel)
    }
    
    func setLayout() {
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
    }
}

extension StaffMissionCollectionHeaderView {
    
    func configureView(data: String) {
        dateLabel.text = data
    }
}
