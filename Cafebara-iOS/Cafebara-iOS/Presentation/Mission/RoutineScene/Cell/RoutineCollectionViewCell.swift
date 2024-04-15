//
//  RoutineCollectionViewCell.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/8/24.
//

import UIKit

import RxSwift
import SnapKit
import Then

final class RoutineCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static let isFromNib: Bool = false
    var disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let backGroundView = UIView()
    private let routineKeywordLabel = CustomPaddingLabel(padding: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10))
    private let routineExplainLabel = UILabel()
    let deleteButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension RoutineCollectionViewCell {
    
    func setUI() {
        backGroundView.do {
            $0.backgroundColor = .whiteBara
            $0.setRoundBorder(borderColor: .gray1,
                              borderWidth: 1,
                              cornerRadius: 8)
        }
    }
    
    func setStyle() {
        routineKeywordLabel.do {
            $0.font = .fontBara(.caption1)
            $0.asLineHeight(.caption1)
            $0.layer.cornerRadius = 12
            $0.layer.masksToBounds = true
        }
        
        routineExplainLabel.do {
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
            $0.textColor = .gray7
            $0.numberOfLines = 0
            $0.lineBreakMode = .byCharWrapping
        }
        
        deleteButton.do {
            $0.setImage(UIImage(resource: .icTodoDeleteGray2), for: .normal)
        }
    }
    
    func setHierarchy() {
        addSubview(backGroundView)
        backGroundView.addSubviews(routineKeywordLabel,
                                   routineExplainLabel,
                                   deleteButton)
    }
    
    func setLayout() {
        backGroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 40)
        }
        
        routineKeywordLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        routineExplainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(10)
            $0.size.equalTo(18)
        }
    }
}

extension RoutineCollectionViewCell {
    
    func configureCell(data: RoutineInfo) {
        routineKeywordLabel.text = data.routineKeyword
        routineKeywordLabel.textColor = UIColor(hex: data.routineKeywordTextColor)
        routineKeywordLabel.backgroundColor = UIColor(hex: data.routineKeywordBackColor)
        routineExplainLabel.text = data.routineExplain
    }
}
