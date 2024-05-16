//
//  NoticeViewModel.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/8/24.
//

import UIKit
import RxSwift
import RxRelay

protocol NoticeViewModelInputs {
    
    func configureData()
}

protocol NoticeViewModelOutputs {
    
    var noticeInfoData: BehaviorRelay<[NoticeInfo]> { get }
}

protocol NoticeViewModelType {
    
    var inputs: NoticeViewModelInputs { get }
    var outputs: NoticeViewModelOutputs { get }
}

final class NoticeViewModel: NoticeViewModelInputs, NoticeViewModelOutputs, NoticeViewModelType {
    
    var inputs: NoticeViewModelInputs { return self }
    var outputs: NoticeViewModelOutputs { return self }
    
    private let disposeBag = DisposeBag()
    
    // Inputs
    func configureData() {
        // TODO: 서버 통신 데이터를 가져오는 로직
    }
    
    // Outputs
    var noticeInfoData: BehaviorRelay<[NoticeInfo]> = BehaviorRelay<[NoticeInfo]>(value: NoticeInfo.noticeDummy())
}
