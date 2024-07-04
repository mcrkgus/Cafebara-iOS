//
//  scheduleReplacementViewModel.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/22/24.
//

import Foundation

import Moya
import RxSwift
import RxCocoa

protocol ScheduleReplacementViewModelInputs {
    func configureData()
    func didTapRejectButton()
    func didTapAcceptButton()
}

protocol ScheduleReplacementViewModelOutputs {
    var scheduleReplacementInfoData: BehaviorRelay<[ScheduleReplacementInfo]> { get }
    var rejectButtonTapResult: PublishRelay<String> { get }
    var acceptButtonTapResult: PublishRelay<String> { get }
}

protocol ScheduleReplacementViewModelType {
    var inputs: ScheduleReplacementViewModelInputs { get }
    var outputs: ScheduleReplacementViewModelOutputs { get }
}

final class ScheduleReplacementViewModel: ScheduleReplacementViewModelInputs, ScheduleReplacementViewModelOutputs, ScheduleReplacementViewModelType {
    var inputs: ScheduleReplacementViewModelInputs { return self }
    var outputs: ScheduleReplacementViewModelOutputs {
        return self
    }
    
    private let disposeBag = DisposeBag()
    
    func configureData() {
        // TODO: 서버 통신 데이터를 가져오는 로직
    }
    
    func didTapRejectButton() {
        rejectButtonTapResult.accept("거절버튼 눌림")
    }
    
    func didTapAcceptButton() {
        acceptButtonTapResult.accept("수락버튼 눌림")
    }

    var scheduleReplacementInfoData: BehaviorRelay<[ScheduleReplacementInfo]> =
    BehaviorRelay<[ScheduleReplacementInfo]> (value:
                                                ScheduleReplacementInfo.scheduleReplacementDummy())
    
    var rejectButtonTapResult: PublishRelay<String> = PublishRelay<String>()
    var acceptButtonTapResult: PublishRelay<String> = PublishRelay<String>()
}
