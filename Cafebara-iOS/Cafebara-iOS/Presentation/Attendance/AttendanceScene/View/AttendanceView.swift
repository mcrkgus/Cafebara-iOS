//
//  AttendanceView.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/20/24.
//

import UIKit

import SnapKit
import Then

final class AttendanceView: UIView {
    
    // MARK: - Properties
    var  isWorking: Bool = false
    
    // MARK: - UI Components
    
    let navigationBar = CustomNavigationView()
    private let attendanceTitleLabel = UILabel()
    private let storeNameLabel = UILabel()
    private let attendanceStackView = UIStackView()
    private let todayDateLabel = UILabel()
    private let dividerLine = UILabel()
    private let statusLabel = UILabel()
    private let userName = UILabel()
    private let greetingLabel = UILabel()
    private let attendanceBaraLottie = UIImageView()
    let startWorkButton = CustomButton(status: true, type: .noBorder, title: I18N.Attendance.goToWorkButtonTitle)
    let finishWorkButton = CustomButton(status: true, type: .hasBorder, title: I18N.Attendance.goToHomeButtonTitle)
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        updateStaus()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension AttendanceView {
    
    func setUI() {
        backgroundColor = .backgroundBara
    }
    
    func setStyle() {
        navigationBar.do {
            $0.isTitleLabelIncluded = true
            $0.isBackButtonIncluded = false
            $0.titleLabelText = I18N.Attendance.attendanceTitle
        }
        
        attendanceTitleLabel.do {
            $0.text = I18N.Attendance.attendanceTitle
            $0.textColor = .gray7
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.font = .fontBara(.heading)
            $0.asLineHeight(.heading)
        }
        
        storeNameLabel.do {
            $0.text = "OMG카페"
            //TODO: UserDefault 업장이름 변경
            $0.textColor = .gray7
            $0.font = .fontBara(.title2)
            $0.numberOfLines = 0
            $0.asLineHeight(.title2)
        }
        
        attendanceStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6
            $0.alignment = .center
            $0.distribution = .equalSpacing
        }
        
        todayDateLabel.do {
            $0.text = "02월 15일 목요일"
            //TODO: 서버통신시 변경
            $0.textColor = .gray3
            $0.font = .fontBara(.body1)
            $0.numberOfLines = 0
            $0.asLineHeight(.body1)
        }
        
        dividerLine.do {
            $0.text = " | "
            $0.textColor = .gray2
            $0.font = .fontBara(.body1)
            $0.numberOfLines = 0
            $0.asLineHeight(.body1)
        }
        
        statusLabel.do {
            $0.text = I18N.Attendance.beforeWorkLabel
            //TODO: 서버통신시 변경
            $0.textColor = .gray3
            $0.font = .fontBara(.body1)
            $0.numberOfLines = 0
            $0.asLineHeight(.body1)
        }
        
        userName.do {
            $0.text = "방바라"
            //TODO: UserDefaults에서 이름 받아서 변경
            $0.font = .fontBara(.title1)
            $0.textColor = .blueBara
            $0.asLineHeight(.title1)
        }
        
        greetingLabel.do {
            $0.text = I18N.Attendance.greetingLabel
            $0.font = .fontBara(.title1)
            $0.textColor = .gray7
            $0.asLineHeight(.title1)
        }
        
        attendanceBaraLottie.do {
            switch SizeLiterals.Screen.screenWidth {
            case ...375: // SE
                $0.image = .attendance3
            case 376...393: // 13 mini / 13, 14 pro
                $0.image = .attendance2
            default: // 14 plus / 14, 15 pro max
                $0.image = .attendance1
            }
            $0.contentMode = .scaleAspectFit
        }
        
        startWorkButton.do {
            $0.isHidden = false
        }
        
        finishWorkButton.do {
            $0.isHidden = true
        }
    }
    
    func setHierarchy() {
        addSubviews(navigationBar,
                    storeNameLabel,
                    attendanceStackView,
                    todayDateLabel,
                    dividerLine,
                    statusLabel,
                    attendanceBaraLottie,
                    startWorkButton,
                    finishWorkButton)
        
        attendanceStackView.addArrangedSubviews(userName,
                                                greetingLabel)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide)
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(navigationBar.snp.bottom).offset(16)
        }
        
        todayDateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(100)
            $0.top.equalTo(navigationBar.snp.bottom).offset(55)
        }
        
        dividerLine.snp.makeConstraints {
            $0.leading.equalTo(todayDateLabel.snp.trailing).offset(6)
            $0.top.equalTo(navigationBar.snp.bottom).offset(55)
        }
        
        statusLabel.snp.makeConstraints {
            $0.leading.equalTo(dividerLine.snp.trailing).offset(6)
            $0.top.equalTo(navigationBar.snp.bottom).offset(55)
        }
        
        attendanceStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(attendanceBaraLottie.snp.bottom).offset(28)
        }
        
        attendanceBaraLottie.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            switch SizeLiterals.Screen.screenWidth {
            case ...375:
                $0.top.equalTo(navigationBar.snp.bottom).offset(103)
            case 376...393:
                $0.top.equalTo(navigationBar.snp.bottom).offset(147)
            default:
                $0.top.equalTo(navigationBar.snp.bottom).offset(184)
            }
        }
        
        [startWorkButton, finishWorkButton].forEach{
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                switch SizeLiterals.Screen.screenWidth {
                case ...375:
                    $0.top.equalTo(attendanceStackView.snp.bottom).offset(44)
                case 376...393:
                    $0.top.equalTo(attendanceStackView.snp.bottom).offset(81)
                default:
                    $0.top.equalTo(attendanceStackView.snp.bottom).offset(118)
                }
            }
        }
    }
    
    func updateStaus() {
        startWorkButton.isHidden = isWorking
        finishWorkButton.isHidden = !isWorking
        if isWorking {
            statusLabel.text = I18N.Attendance.workingLabel
            statusLabel.textColor = .blueBara
        } else {
            statusLabel.text = I18N.Attendance.beforeWorkLabel
            statusLabel.textColor = .gray3
        }
    }
}
