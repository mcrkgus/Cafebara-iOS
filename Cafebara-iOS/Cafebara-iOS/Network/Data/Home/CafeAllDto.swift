//
//  CafeAllDto.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/8/24.
//

import Foundation

struct CafeAllDto: Codable {
    let cafeID: Int
    let cafeName, cafeCreatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case cafeID = "cafeId"
        case cafeName, cafeCreatedAt
    }
}

extension CafeAllDto {
    static func cafeAllInitValue() -> [CafeAllDto] {
        return [
            CafeAllDto(cafeID: 1, cafeName: "홀리몰리 카페", cafeCreatedAt: "2024.03.12"),
            CafeAllDto(cafeID: 2, cafeName: "강강술래 카페", cafeCreatedAt: "2024.03.12")
        ]
    }
}
