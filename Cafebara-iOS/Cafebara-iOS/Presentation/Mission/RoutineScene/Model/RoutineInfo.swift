//
//  RoutineInfo.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/8/24.
//

import Foundation

import RxDataSources

struct RoutineInfo: Codable {
    let routineKeyword: String
    let routineKeywordTextColor: String
    let routineKeywordBackColor: String
    let routineExplain: String
}

struct SectionOfRoutine {
    var items: [Item]
}

extension SectionOfRoutine: SectionModelType {
    
    typealias Item = RoutineInfo
    
    init(original: SectionOfRoutine, items: [RoutineInfo]) {
        self = original
        self.items = items
    }
}
