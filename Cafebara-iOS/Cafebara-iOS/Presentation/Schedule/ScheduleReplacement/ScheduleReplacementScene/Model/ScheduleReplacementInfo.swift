//
//  scheduleReplacementInfo.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/22/24.
//

import Foundation

struct ScheduleReplacementInfo: Codable {
    let date: String
    let workTag: String
    let workKeywordTextColor: String
    let workKeywordBackColor: String
    let workStartTime: String
    let workEndTime: String
    let senderName: String
}

extension ScheduleReplacementInfo {
    static func scheduleReplacementDummy() -> [ScheduleReplacementInfo] {
        return [
            ScheduleReplacementInfo(date: "02.14.수요일", workTag: "오픈", workKeywordTextColor: "#1F9BB6", workKeywordBackColor: "#EAFBFA", workStartTime: "9:00", workEndTime: "13:00", senderName: "김가현")
        ]
    }
}
