//
//  HomeMemberScheduleCollectionViewCell.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/15/24.
//

import UIKit

import SnapKit
import Then

final class HomeMemberScheduleCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties

    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let memberNameLabel = UILabel()
    private let memberPartStartTimeLabel = UILabel()
    private let memberPartEndTimeLabel = UILabel()
    private let memberPartMidLabel = UILabel()
    private let memberPartTimeStackView = UIStackView()
    private let memberScheduleType = UILabel()
    
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

private extension HomeMemberScheduleCollectionViewCell {

    func setUI() {
        self.do {
            $0.backgroundColor = .whiteBara
            $0.setRoundBorder(borderColor: .gray1, borderWidth: 1, cornerRadius: 8)
        }
    }
    
    func setStyle() {
        memberNameLabel.do {
            $0.font = .fontBara(.body4)
            $0.asLineHeight(.body4)
            $0.textColor = .gray7
        }
        
        memberScheduleType.do {
            $0.font = .fontBara(.caption1)
            $0.asLineHeight(.caption1)
            $0.textAlignment = .center
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }
        
        [memberPartStartTimeLabel, memberPartEndTimeLabel, memberPartMidLabel].forEach {
            $0.do {
                $0.textColor = .gray5
                $0.textAlignment = .center
                $0.font = .fontBara(.body4)
                $0.asLineHeight(.body4)
            }
        }
        
        memberPartMidLabel.do {
            $0.text = "~"
        }
        
        memberPartTimeStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
        }
    }
    
    func setHierarchy() {
        memberPartTimeStackView.addArrangedSubviews(memberPartStartTimeLabel, memberPartMidLabel, memberPartEndTimeLabel)
        addSubviews(memberNameLabel, memberScheduleType, memberPartTimeStackView)
    }
    
    func setLayout() {
        memberNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        memberScheduleType.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(63)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 20 / 812)
        }
        
        memberPartTimeStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(memberScheduleType.snp.leading).offset(-63)
        }
    }
}

extension HomeMemberScheduleCollectionViewCell {

    func configureCell(model: MemberScheduleDto) {
        memberNameLabel.text = model.memberName
        memberPartStartTimeLabel.text = model.partStartTime
        memberPartEndTimeLabel.text = model.partEndTime
        memberScheduleType.text = model.scheduleType
        
        switch model.scheduleType {
        case "근무완료":
            memberScheduleType.backgroundColor = .orange10
            memberScheduleType.textColor = .orangeBara
        case "근무중":
            memberScheduleType.backgroundColor = .orangeBara
            memberScheduleType.textColor = .whiteBara
        case "근무예정":
            memberScheduleType.backgroundColor = .gray1
            memberScheduleType.textColor = .gray3
        case "결근":
            memberScheduleType.backgroundColor = .errorBara
            memberScheduleType.textColor = .whiteBara
        default:
            break
        }
    }
}
