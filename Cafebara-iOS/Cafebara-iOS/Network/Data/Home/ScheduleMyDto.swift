//
//  ScheduleMyDto.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/8/24.
//

import Foundation

struct ScheduleMyDto: Codable {
    let date: String
    let hasSchedule: Bool
}

extension ScheduleMyDto {
    static func scheduleMyDtoInitValue() -> [ScheduleMyDto] {
        return [
            ScheduleMyDto(date: "2024.04.14", hasSchedule: true),
            ScheduleMyDto(date: "2024.04.15", hasSchedule: false),
            ScheduleMyDto(date: "2024.04.16", hasSchedule: true),
            ScheduleMyDto(date: "2024.04.17", hasSchedule: false),
            ScheduleMyDto(date: "2024.04.18", hasSchedule: false),
            ScheduleMyDto(date: "2024.04.19", hasSchedule: false),
            ScheduleMyDto(date: "2024.04.20", hasSchedule: true)
        ]
    }
}
