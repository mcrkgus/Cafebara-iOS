//
//  NoticeInfo.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/8/24.
//

import Foundation

struct NoticeInfo: Codable {
    let staffName: String
    let date: [Int]
    let noticeType: String
}

extension NoticeInfo {
    static func noticeDummy() -> [NoticeInfo] {
        return [
            NoticeInfo(staffName: "", date: [1998, 06, 22], noticeType: "a"),
            NoticeInfo(staffName: "", date: [1998, 06, 22], noticeType: "a"),
            NoticeInfo(staffName: "", date: [2024, 06, 22], noticeType: "a"),
            NoticeInfo(staffName: "김가현", date: [2024, 06, 22], noticeType: "b"),
            NoticeInfo(staffName: "고아라", date: [1998, 06, 22], noticeType: "b"),
            NoticeInfo(staffName: "", date: [1998, 06, 22], noticeType: "a"),
            NoticeInfo(staffName: "강민수", date: [1998, 06, 22], noticeType: "b"),
            NoticeInfo(staffName: "", date: [2026, 06, 22], noticeType: "a"),
            NoticeInfo(staffName: "김보연", date: [1998, 06, 22], noticeType: "b")
        ]
    }
}
