//
//  scheduleReplacementView.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/22/24.
//

import UIKit

import SnapKit
import Then

final class ScheduleReplacementView: UIView {
    
    // MARK: - UI Components
    
    private let dimmedView = UIView()
    private let scheduleReplacementView = UIView()
    private let scheduleReplacementTitle = UILabel()
    private let scheduleDate = UILabel()
    private let replacementDateLabel = UILabel()
    private let scheduleTime = UILabel()
    private let workTimeStackView = UIStackView()
    private let replacementStartTimeLabel = UILabel()
    private let swungDashLabel = UILabel()
    private let replacementEndTimeLabel = UILabel()
    private let workKeywordLabel = CustomPaddingLabel(padding: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10))
    private let scheduleWorker = UILabel()
    private let nameBoxView = UIView()
    private let replacementSenderLabel = UILabel()
    let rejectButton = UIButton()
    let acceptButton = UIButton()
    
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

extension ScheduleReplacementView {
    
    func setUI() {
        backgroundColor = .backgroundBara
    }
    
    func setStyle() {
        dimmedView.do {
            $0.backgroundColor = .black
            $0.alpha = 0.3
        }
        
        scheduleReplacementView.do {
            $0.setRoundBorder(borderColor: .gray1, borderWidth: 1, cornerRadius: 12)
            $0.backgroundColor = .backgroundBara
        }
        
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
            $0.text = "02.14 수요일"
            //TODO: 대체근무 날짜 서버통신 시 변경
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
        
        workTimeStackView.do {
            $0.spacing = 8
            $0.axis = .horizontal
            $0.alignment = .center
        }
        
        replacementStartTimeLabel.do {
            $0.text = "9:00"
            //TODO: 대체근무 시작시간 서버통신 시 가져오기
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
            $0.text = "13:00"
            //TODO: 대체근무 종료시간 서버통신 시 가져오기
            $0.textColor = .gray5
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
        }
        
        workKeywordLabel.do {
            $0.text = "마감마감마감"
            $0.textColor = .labelText3
            $0.backgroundColor = .label3
            //TODO: text, textColor, backgroundColor 서버통신 시 가져오기
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
            $0.text = "김보연"
            //TODO: 대체근무수신자 서버통신 시 가져오기
            $0.textColor = .gray7
            $0.font = .fontBara(.body4)
            $0.asLineHeight(.body4)
        }
        
        rejectButton.do {
            $0.setTitle(I18N.ReplacementWork.rejectButtonLabel, for: .normal)
            $0.titleLabel?.font = .fontBara(.body3)
            $0.setTitleColor(.blueBara, for: .normal)
            $0.backgroundColor = .blue10
            $0.setRoundBorder(borderColor: .blueBara, borderWidth: 1, cornerRadius: 6)
        }
        
        acceptButton.do {
            $0.setTitle(I18N.ReplacementWork.acceptButtonLabel, for: .normal)
            $0.titleLabel?.font = .fontBara(.body3)
            $0.setTitleColor(.blueBara, for: .normal)
            $0.backgroundColor = .blue10
            $0.setRoundBorder(borderColor: .blueBara, borderWidth: 1, cornerRadius: 6)
        }
    }
    
    func setHierarchy() {
        addSubviews(dimmedView,
                    scheduleReplacementView)
        scheduleReplacementView.addSubviews(scheduleReplacementTitle,
                                            scheduleDate,
                                            replacementDateLabel,
                                            scheduleTime,
                                            workKeywordLabel,
                                            workTimeStackView,
                                            scheduleWorker,
                                            nameBoxView,
                                            rejectButton,
                                            acceptButton)
        workTimeStackView.addArrangedSubviews(replacementStartTimeLabel,
                                              swungDashLabel,
                                              replacementEndTimeLabel)
        nameBoxView.addSubview(replacementSenderLabel)
    }
    
    func setLayout() {
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scheduleReplacementView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(425)
            $0.width.equalTo(312)
        }
        
        scheduleReplacementTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(64)
            $0.trailing.equalToSuperview().inset(63)
        }
        
        scheduleDate.snp.makeConstraints {
            $0.top.equalToSuperview().inset(77)
            $0.leading.equalToSuperview().inset(22)
            $0.trailing.equalToSuperview().inset(234)
        }
        
        replacementDateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(105)
            $0.leading.equalToSuperview().inset(22)
            $0.trailing.equalToSuperview().inset(198)
        }
        
        scheduleTime.snp.makeConstraints {
            $0.top.equalToSuperview().inset(155)
            $0.leading.equalToSuperview().inset(22)
            $0.trailing.equalToSuperview().inset(234)
        }
        
        workKeywordLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(183)
            $0.leading.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(218)
        }
        
        workTimeStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(183)
            $0.leading.equalTo(workKeywordLabel.snp.trailing).offset(12)
            $0.bottom.equalToSuperview().inset(218)
        }
        
        scheduleWorker.snp.makeConstraints {
            $0.top.equalToSuperview().inset(235)
            $0.leading.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(170)
        }
        
        replacementSenderLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        nameBoxView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(263)
            $0.leading.equalToSuperview().inset(22)
            $0.trailing.equalToSuperview().inset(84)
            $0.bottom.equalToSuperview().inset(124)
        }
        
        rejectButton.snp.makeConstraints {
            $0.top.equalTo(nameBoxView.snp.bottom).offset(52)
            $0.leading.equalToSuperview().inset(22)
            $0.trailing.equalToSuperview().inset(161)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        acceptButton.snp.makeConstraints {
            $0.top.equalTo(nameBoxView.snp.bottom).offset(52)
            $0.leading.equalToSuperview().inset(161)
            $0.trailing.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    func configureView(data: ScheduleReplacementInfo) {
        replacementDateLabel.text = data.date
        workKeywordLabel.text = data.workTag
        workKeywordLabel.textColor = UIColor(hex : data.workKeywordTextColor)
        workKeywordLabel.backgroundColor = UIColor(hex : data.workKeywordBackColor)
        replacementStartTimeLabel.text = data.workStartTime
        replacementEndTimeLabel.text = data.workEndTime
        replacementSenderLabel.text = data.senderName
    }
}
