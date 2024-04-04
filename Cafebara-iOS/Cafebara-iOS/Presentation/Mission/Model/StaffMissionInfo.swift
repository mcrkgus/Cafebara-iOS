//
//  StaffMissionInfo.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/2/24.
//

import Foundation

import RxDataSources

struct StaffMissionInfo: Codable {
    let name: String
    let workKeyword: String
    let workKeywordTextColor: String
    let workKeywordBackColor: String
    let startTime: String
    let endTiem: String
}

struct SectionOfStaffMission {
    var header: String
    var items: [Item]
}

extension SectionOfStaffMission: SectionModelType {
    
    typealias Item = StaffMissionInfo
    
    init(original: SectionOfStaffMission, items: [StaffMissionInfo]) {
        self = original
        self.items = items
    }
}
