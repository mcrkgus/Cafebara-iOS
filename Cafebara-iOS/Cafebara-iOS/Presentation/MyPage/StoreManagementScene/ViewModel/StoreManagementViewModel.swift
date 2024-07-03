//
//  StoreManagementViewModel.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/30/24.
//

import UIKit

import RxSwift
import RxRelay

protocol StoreManagementViewModelInputs {
}

protocol StoreManagementViewModelOutputs {
    var storeManageInfo: BehaviorSubject<[StoreInfoSection]> { get }
}

protocol StoreManagementViewModelType {
    var inputs: StoreManagementViewModelInputs { get }
    var outputs: StoreManagementViewModelOutputs { get }
}

final class StoreManagementViewModel: StoreManagementViewModelInputs, StoreManagementViewModelOutputs, StoreManagementViewModelType {
    
    var inputs: StoreManagementViewModelInputs { return self }
    var outputs: StoreManagementViewModelOutputs { return self }
    var selectedIndexPath = BehaviorRelay<IndexPath?>(value: nil)
    
    private let disposeBag = DisposeBag()
    private let headerView = StoreManagementCollectionHeaderView()
    
    // TODO: 서버 통신시 PublishSubject로 변경하기
    var storeManageInfo = BehaviorSubject<[StoreInfoSection]>(value: [])
    
    init() {
        var storeManageDTO: [StoreManagementInfo] = [
            StoreManagementInfo(storeName: "티니핑핑이카페", date: [2019, 06, 22], staffNum: 4),
            StoreManagementInfo(storeName: "예스리사장카페", date: [2019, 08, 22], staffNum: 8),
            StoreManagementInfo(storeName: "민지사장카페", date: [2019, 12, 28], staffNum: 12),
            StoreManagementInfo(storeName: "보여니사장카페", date: [2019, 09, 14], staffNum: 2),
            StoreManagementInfo(storeName: "랄라라라랄카페", date: [2019, 04, 12], staffNum: 0),
            StoreManagementInfo(storeName: "티니핑핑이카페", date: [2019, 06, 22], staffNum: 4),
            StoreManagementInfo(storeName: "예스리사장카페", date: [2019, 08, 22], staffNum: 8),
            StoreManagementInfo(storeName: "민지사장카페", date: [2019, 12, 28], staffNum: 12),
            StoreManagementInfo(storeName: "보여니사장카페", date: [2019, 09, 14], staffNum: 2),
            StoreManagementInfo(storeName: "랄라라라랄카페", date: [2019, 04, 12], staffNum: 0)
        ]
        storeManageInfo.onNext([StoreInfoSection(header: headerView , items: storeManageDTO)])
    }
}

