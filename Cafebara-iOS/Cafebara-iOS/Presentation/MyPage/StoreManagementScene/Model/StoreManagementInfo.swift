//
//  StoreManagementInfo.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/30/24.
//

import UIKit

import RxDataSources

struct StoreManagementInfo: Codable {
    let storeName: String
    let date: [Int]
    let staffNum: Int
}

struct StoreInfoSection {
    var header: UIView
    var items: [Item]
}

extension StoreInfoSection: SectionModelType {
    typealias Item = StoreManagementInfo
    
    init(original: StoreInfoSection, items: [StoreManagementInfo]) {
        self = original
        self.items = items
    }
}
