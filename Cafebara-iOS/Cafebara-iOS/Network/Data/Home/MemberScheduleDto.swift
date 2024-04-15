//
//  MemberScheduleDto.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/15/24.
//

import Foundation

struct MemberScheduleDto: Codable {
    let memberID: Int
    let memberName, partStartTime, partEndTime, scheduleType: String

    enum CodingKeys: String, CodingKey {
        case memberID = "memberId"
        case memberName, partStartTime, partEndTime, scheduleType
    }
}

extension MemberScheduleDto {
    static func memberScheduleDtoInitValue() -> [MemberScheduleDto] {
        return [
            MemberScheduleDto(memberID: 1, memberName: "고아라", partStartTime: "11:00", partEndTime: " 14:00", scheduleType: "근무완료"),
            MemberScheduleDto(memberID: 2, memberName: "방민지", partStartTime: "11:00", partEndTime: " 14:00", scheduleType: "근무중"),
            MemberScheduleDto(memberID: 3, memberName: "강민수", partStartTime: "11:00", partEndTime: " 14:00", scheduleType: "근무예정"),
            MemberScheduleDto(memberID: 4, memberName: "김가현", partStartTime: "11:00", partEndTime: " 14:00", scheduleType: "결근")
        ]
    }
}
