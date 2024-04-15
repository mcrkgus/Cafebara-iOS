//
//  HomeViewModel.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/8/24.
//

import UIKit

import RxSwift
import RxCocoa

protocol HomeViewModelInputs {
    func getMemberMyDto()
    func getCafeAllDto()
    func getCafeNoticeDto()
    func getScheduleMyDto()
    func getMemberScheduleDto()
}

protocol HomeViewModelOutputs {
    var memberMyData: BehaviorSubject<MemberMyDto> { get }
    var cafeAllData: BehaviorSubject<[CafeAllDto]> { get }
    var cafeNoticeData: BehaviorSubject<[CafeNoticeDto]> { get }
    var scheduleMyData: BehaviorSubject<[ScheduleMyDto]> { get }
    var memberScheduleData: BehaviorSubject<[MemberScheduleDto]> { get }
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelInputs, HomeViewModelOutputs, HomeViewModelType {
    
    var inputs: HomeViewModelInputs { return self }
    var outputs: HomeViewModelOutputs { return self }
    
    init() {
        getMemberMyDto()
        getCafeAllDto()
        getCafeNoticeDto()
        getScheduleMyDto()
        getMemberScheduleDto()
    }
    
    // input
    
    func getMemberMyDto() {
        memberMyData.onNext(MemberMyDto.memberMyInitValue())
    }
    
    func getCafeAllDto() {
        cafeAllData.onNext(CafeAllDto.cafeAllInitValue())
    }
    
    func getCafeNoticeDto() {
        cafeNoticeData.onNext(CafeNoticeDto.cafeNoticeInitValue())
    }
    
    func getScheduleMyDto() {
        scheduleMyData.onNext(ScheduleMyDto.scheduleMyDtoInitValue())
    }
    
    func getMemberScheduleDto() {
        memberScheduleData.onNext(MemberScheduleDto.memberScheduleDtoInitValue())
    }
    
    // output
    
    var memberMyData: BehaviorSubject<MemberMyDto> = BehaviorSubject<MemberMyDto>(value: MemberMyDto.memberMyInitValue())
    var cafeAllData: BehaviorSubject<[CafeAllDto]> = BehaviorSubject<[CafeAllDto]>(value: CafeAllDto.cafeAllInitValue())
    var cafeNoticeData: BehaviorSubject<[CafeNoticeDto]> = BehaviorSubject<[CafeNoticeDto]>(value: CafeNoticeDto.cafeNoticeInitValue())
    var scheduleMyData: BehaviorSubject<[ScheduleMyDto]> = BehaviorSubject<[ScheduleMyDto]>(value: ScheduleMyDto.scheduleMyDtoInitValue())
    var memberScheduleData: BehaviorSubject<[MemberScheduleDto]> = BehaviorSubject<[MemberScheduleDto]>(value: MemberScheduleDto.memberScheduleDtoInitValue())
}
