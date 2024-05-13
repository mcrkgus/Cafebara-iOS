//
//  MemberMyDto.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/8/24.
//

import Foundation

struct MemberMyDto: Codable {
    let memberName: String
}

extension MemberMyDto {
    static func memberMyInitValue() -> MemberMyDto {
        return MemberMyDto(memberName: "김보연")
    }
}
