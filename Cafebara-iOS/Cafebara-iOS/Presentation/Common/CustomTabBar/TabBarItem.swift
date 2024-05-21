//
//  TabBarItem.swift
//  Cafebara-iOS
//
//  Created by Gahyun Kim on 2024/03/11.
//

import UIKit

enum TabBarItem: CaseIterable {
    
    case home, todo, schedule, work, mypage
    
    // 선택되지 않은 탭
    var normalItem: UIImage? {
        switch self {
        case .home:
            return .icHomeInactive
        case .todo:
            return UserDefaults.standard.bool(forKey: "isOwner") ? .icMissionInactive : .icTodoInactive
        case .schedule:
            return .icCalenderInactive
        case .work:
            return .icWorkInactive
        case .mypage:
            return .icMypageInactive
        }
    }
    
    // 선택된 탭
    var selectedItem: UIImage? {
        switch self {
        case .home:
            return .icHomeActive
        case .todo:
            return UserDefaults.standard.bool(forKey: "isOwner") ? .icMissionActive : .icTodoActive
        case .schedule:
            return .icCalenderActive
        case .work:
            return .icWorkActive
        case .mypage:
            return .icMypageActive
        }
    }
    
    // 탭 별 제목
    var itemTitle: String? {
        switch self {
        case .home: 
            return I18N.Common.tabBarhome
        case .todo:
            return UserDefaults.standard.bool(forKey: "isOwner") ? I18N.Common.tabBarMission : I18N.Common.tabBarToDo
        case .schedule:
            return I18N.Common.tabBarSchedule
        case .work: 
            return I18N.Common.tabBarWork
        case .mypage: 
            return I18N.Common.tabBarMyPage
        }
    }
    
    // 탭 별 전환될 화면 -> 나중에 하나씩 추가
    var targetViewController: UIViewController {
        switch self {
        case .home: 
            return HomeViewController()
        case .todo:
            return UserDefaults.standard.bool(forKey: "isOwner") ? MissionViewController() : ViewController()
        case .schedule:
            return ViewController() // ScheduleViewController()
        case .work: 
            return AttendanceViewController() 
        case .mypage:
            return ViewController() // MyPageViewController()
        }
    }
}
