//
//  scheduleReplacementView.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/22/24.
//

import UIKit

import SnapKit
import Then

final class scheduleReplacementView: UIView {

    // MARK: - Properties
    
    
    // MARK: - UI Components
    private let scheduleReplacementTitle = UILabel()
    private let scheduleDate = UILabel()
    private let replacementDateLabel = UILabel()
    private let scheduleTime = UILabel()
    private let replacementStartTimeLabel = UILabel()
    private let swungDashLabel = UILabel()
    private let replacementEndTimeLabel = UILabel()
    private let workKeywordLabel = CustomPaddingLabel(padding: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10))
    private let scheduleWorker = UILabel()
    private let nameBoxView = UIView()
    private let replacementSenderLabel = UILabel()
    private let refuseButton = UIButton()
    private let acceptButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension scheduleReplacementView {

    func setUI() {
        backgroundColor = .backgroundBara
    }

    func setStyle() {
        scheduleReplacementTitle.do {
            $0.text = I18N.ReplacementWork.replacementWorkTitle
            $0.textColor = .gray7
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
            $0.numberOfLines = 0
        }
        
        scheduleDate.do {
            $0.text = I18N.ReplacementWork.replacementWorkDate
            $0.textColor = .gray4
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
        }
        
        replacementDateLabel.do {
            $0.text = ""
            $0.textColor = .gray5
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
        }
        
        scheduleTime.do {
            $0.text = I18N.ReplacementWork.replacementWorkTime
            $0.textColor = .gray4
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
        }
        
        replacementStartTimeLabel.do {
            $0.text = ""
            $0.textColor = .gray5
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
        }
        
        swungDashLabel.do {
            $0.text = I18N.MyWork.swungDash
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
            $0.textColor = .gray5
        }
        
        replacementEndTimeLabel.do {
            $0.text = ""
            $0.textColor = .gray5
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
        }
        
        workKeywordLabel.do {
            $0.font = .fontBara(.caption1)
            $0.asLineHeight(.caption1)
            $0.layer.cornerRadius = 12
            $0.layer.masksToBounds = true
        }
        
        scheduleWorker.do {
            $0.text = I18N.ReplacementWork.replacementSender
            $0.textColor = .gray4
            $0.font = .fontBara(.body3)
            $0.asLineHeight(.body3)
        }
        
        nameBoxView.do {
            $0.backgroundColor = .clear
            $0.setRoundBorder(borderColor: .gray1, borderWidth: 1, cornerRadius: 12)
        }
        
        replacementSenderLabel.do {
            $0.text = ""
            $0.textColor = .gray7
            $0.font = .fontBara(.body4)
            $0.asLineHeight(.body4)
        }
    }
    
    func setHierarchy() {
        addSubviews(scheduleReplacementTitle,
                    scheduleDate,
                    replacementDateLabel,
                    scheduleTime,
                    workKeywordLabel,
                    scheduleWorker,
                    nameBoxView)
        nameBoxView.addSubview(replacementSenderLabel)
    }
    
    func setLayout() {

    }
    
    func setRegisterCell() {
        
    }
}

extension scheduleReplacementView {

    func configureView() {
        
    }
}
