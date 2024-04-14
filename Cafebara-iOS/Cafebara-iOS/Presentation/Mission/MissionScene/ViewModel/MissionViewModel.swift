//
//  MissionViewModel.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/1/24.
//

import UIKit

import Moya
import RxSwift
import RxRelay

protocol MissionViewModelInputs {
}

protocol MissionViewModelOutputs {
    var todayDate: BehaviorSubject<String> { get }
    var staffMissionInfo: BehaviorSubject<[SectionOfStaffMission]> { get }
}

protocol MissionViewModelType {
    var inputs: MissionViewModelInputs { get }
    var outputs: MissionViewModelOutputs { get }
}

final class MissionViewModel: MissionViewModelInputs, MissionViewModelOutputs, MissionViewModelType {
    
    var inputs: MissionViewModelInputs { return self }
    var outputs: MissionViewModelOutputs { return self }
    
    private let disposeBag = DisposeBag()
    
    // input
    
    // output
    // TODO: 서버 통신시 PublishSubject로 변경하기
    var todayDate = BehaviorSubject<String>(value: "")
    var staffMissionInfo = BehaviorSubject<[SectionOfStaffMission]>(value: [])
    
    init() {
        var staffMissionDTO: [StaffMissionInfo] = [
            StaffMissionInfo(name: "강민수", workKeyword: "오픈", workKeywordTextColor: "#FF4F4F", workKeywordBackColor: "#FFF3F3", startTime: "9:00", endTime: "13:00"),
            StaffMissionInfo(name: "고아라", workKeyword: "오픈", workKeywordTextColor: "#FF4F4F", workKeywordBackColor: "#FFF3F3", startTime: "9:00", endTime: "13:00"),
            StaffMissionInfo(name: "방민지", workKeyword: "미들", workKeywordTextColor: "#7827C9", workKeywordBackColor: "#F6F1FD", startTime: "12:00", endTime: "16:00"),
            StaffMissionInfo(name: "김가현", workKeyword: "미들2", workKeywordTextColor: "#1F9BB6", workKeywordBackColor: "#EAFBFA", startTime: "14:00", endTime: "18:00"),
            StaffMissionInfo(name: "김보연", workKeyword: "마감", workKeywordTextColor: "#6CB731", workKeywordBackColor: "#F6FEF3", startTime: "18:00", endTime: "24:00"),
            StaffMissionInfo(name: "강민수", workKeyword: "오픈", workKeywordTextColor: "#FF4F4F", workKeywordBackColor: "#FFF3F3", startTime: "9:00", endTime: "13:00"),
            StaffMissionInfo(name: "고아라", workKeyword: "오픈", workKeywordTextColor: "#FF4F4F", workKeywordBackColor: "#FFF3F3", startTime: "9:00", endTime: "13:00"),
            StaffMissionInfo(name: "방민지", workKeyword: "미들", workKeywordTextColor: "#7827C9", workKeywordBackColor: "#F6F1FD", startTime: "12:00", endTime: "16:00"),
            StaffMissionInfo(name: "김가현", workKeyword: "미들2", workKeywordTextColor: "#1F9BB6", workKeywordBackColor: "#EAFBFA", startTime: "14:00", endTime: "18:00"),
            StaffMissionInfo(name: "김보연", workKeyword: "마감", workKeywordTextColor: "#6CB731", workKeywordBackColor: "#F6FEF3", startTime: "18:00", endTime: "24:00")
        ]
        staffMissionInfo.onNext([SectionOfStaffMission(header: getCurrentDate(), items: staffMissionDTO)])
    }
}

extension MissionViewModel {
    
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "Ko")
        formatter.dateFormat = "MM.dd E요일"
        let currentDate = formatter.string(from: Date())
        
        return currentDate
    }
}
