//
//  StaffMissionCollectionViewCell.swift
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
    
    private let wokerNameLabel = UILabel()
    private let workKeywordLabel = CustomPaddingLabel(padding: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10))
    private let workTimeStackView = UIStackView()
    private let workStartTimeLabel = UILabel()
    private let swungDashLabel = UILabel()
    private let workEndTimeLabel = UILabel()
    private let verticalLineView = UIView()
    let giveMissionButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        drawDottedLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension StaffMissionCollectionViewCell {
    
    func setUI() {
        self.do {
            $0.backgroundColor = .whiteBara
            $0.setRoundBorder(borderColor: .gray1,
                              borderWidth: 1,
                              cornerRadius: 12)
        }
    }
    
    func setStyle() {
        wokerNameLabel.do {
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
            $0.textColor = .gray7
        }
        
        workKeywordLabel.do {
            $0.font = .fontBara(.caption1)
            $0.asLineHeight(.caption1)
            $0.layer.cornerRadius = 12
            $0.layer.masksToBounds = true
        }
        
        workTimeStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .center
        }
        
        workStartTimeLabel.do {
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
            $0.textColor = .gray3
        }
        
        swungDashLabel.do {
            $0.text = I18N.Mission.swungDash
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
            $0.textColor = .gray3
        }
        
        workEndTimeLabel.do {
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
            $0.textColor = .gray3
        }
        
        giveMissionButton.do {
            $0.setTitle("미션 주기", for: .normal)
            $0.titleLabel?.font = .fontBara(.caption1)
            $0.setTitleColor(.blueBara, for: .normal)
            $0.setImage(.icSend, for: .normal)
            $0.alignTextBelow(spacing: 4)
        }
    }
    
    func setHierarchy() {
        addSubviews(wokerNameLabel,
                    workKeywordLabel,
                    workTimeStackView,
                    verticalLineView,
                    giveMissionButton)
        
        workTimeStackView.addArrangedSubviews(workStartTimeLabel,
                                              swungDashLabel,
                                              workEndTimeLabel)
    }
    
    func setLayout() {
        wokerNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalToSuperview().inset(77)
        }
        
        workKeywordLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        workTimeStackView.snp.makeConstraints {
            $0.top.equalTo(wokerNameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(wokerNameLabel)
        }
        
        verticalLineView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(9)
            $0.trailing.equalToSuperview().inset(85)
            $0.width.equalTo(1)
        }
        
        giveMissionButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
            $0.width.equalTo(45)
        }
    }
    
    func drawDottedLine() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.gray2.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [2, 2]
        
        let path = CGMutablePath()
        let startPoint = CGPoint(x: verticalLineView.bounds.midX, y: verticalLineView.bounds.minY)
        let entPoint = CGPoint(x: verticalLineView.bounds.midX, y: verticalLineView.bounds.maxY)
        path.addLines(between: [startPoint, entPoint])
        shapeLayer.path = path
        verticalLineView.layer.addSublayer(shapeLayer)
    }
}

extension StaffMissionCollectionViewCell {
    
    func configureCell(data: StaffMissionInfo) {
        wokerNameLabel.text = data.name
        workKeywordLabel.text = data.workKeyword
        workKeywordLabel.textColor = UIColor(hex: data.workKeywordTextColor)
        workKeywordLabel.backgroundColor = UIColor(hex: data.workKeywordBackColor)
        workStartTimeLabel.text = data.startTime
        workEndTimeLabel.text = data.endTime
    }
}
