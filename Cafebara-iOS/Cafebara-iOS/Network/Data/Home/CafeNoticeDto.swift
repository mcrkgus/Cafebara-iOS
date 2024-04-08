//
//  CafeNoticeDto.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/8/24.
//

import Foundation

struct CafeNoticeDto: Codable {
    let noticeType: String
    let noticeID: Int
    let noticeTitle, noticeModifiedAt: String

    enum CodingKeys: String, CodingKey {
        case noticeType
        case noticeID = "noticeId"
        case noticeTitle, noticeModifiedAt
    }
}

extension CafeNoticeDto {
    static func cafeNoticeInitValue() -> [CafeNoticeDto] {
        return [
            CafeNoticeDto(noticeType: "일반", noticeID: 1, noticeTitle: "공지공지", noticeModifiedAt: "2024.03.12"),
            CafeNoticeDto(noticeType: "필독", noticeID: 2, noticeTitle: "공지예시일까나요를레이", noticeModifiedAt: "2024.03.12")
        ]
    }
}
