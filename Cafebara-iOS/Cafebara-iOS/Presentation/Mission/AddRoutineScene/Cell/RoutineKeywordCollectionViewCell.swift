//
//  RoutineKeywordCollectionViewCell.swift
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
    
    enum KeywordCellType {
        case select
        case add
    }
    
    // MARK: - UI Components
    
    private let backGroundView = UIView()
    private let routineKeywordLabel = CustomPaddingLabel(padding: UIEdgeInsets(top: 6, left: 14, bottom: 6, right: 14))
    private let addRoutineView = UIView()
    private let addImageView = UIImageView()
    private let addRoutineKeywordLabel = UILabel()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension RoutineKeywordCollectionViewCell {
    
    func setStyle() {
        routineKeywordLabel.do {
            $0.font = .fontBara(.body2)
            $0.asLineHeight(.body2)
            $0.layer.cornerRadius = 16
            $0.layer.masksToBounds = true
        }
        
        addRoutineView.do {
            $0.backgroundColor = .whiteBara
            $0.setRoundBorder(borderColor: .gray2,
                              borderWidth: 1,
                              cornerRadius: 12)
        }
        
        addImageView.do {
            $0.image = UIImage(resource: .icAdd16Gray3)
        }
        
        addRoutineKeywordLabel.do {
            $0.font = .fontBara(.caption1)
            $0.asLineHeight(.caption1)
            $0.textColor = .gray3
        }
    }
    
    func setHierarchy(type: KeywordCellType) {
        addSubviews(backGroundView)
        
        switch type {
        case .add:
            backGroundView.addSubviews(routineKeywordLabel)
        case .select:
            backGroundView.addSubviews(addRoutineView)
            addRoutineView.addSubviews(addImageView,
                                       addRoutineKeywordLabel)
        }
    }
    
    func setLayout(type: KeywordCellType) {
        backGroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        switch type {
        case .add:
            routineKeywordLabel.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        case .select:
            addRoutineView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            
            addImageView.snp.makeConstraints {
                $0.top.bottom.equalToSuperview().inset(6)
                $0.leading.equalToSuperview().inset(8)
                $0.size.equalTo(16)
            }
            
            addRoutineKeywordLabel.snp.makeConstraints {
                $0.top.bottom.equalToSuperview().inset(6)
                $0.leading.equalTo(addImageView.snp.trailing).offset(4)
                $0.trailing.equalToSuperview().inset(8)
            }
        }
    }
}

extension RoutineKeywordCollectionViewCell {
    
    func configureCell(data: RoutineKeywordInfo) {
        
        if data.routineKeyword.count < 7 {
            routineKeywordLabel.text = data.routineKeyword
            routineKeywordLabel.textColor = UIColor(hex: data.routineKeywordTextColor)
            routineKeywordLabel.backgroundColor = UIColor(hex: data.routineKeywordBackColor)
            setHierarchy(type: .add)
            setLayout(type: .add)
        } else {
            addRoutineKeywordLabel.text = data.routineKeyword
            setHierarchy(type: .select)
            setLayout(type: .select)
        }
    }
}
