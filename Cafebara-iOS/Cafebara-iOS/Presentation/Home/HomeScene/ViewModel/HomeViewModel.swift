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
}

protocol HomeViewModelOutputs {
    var memberMyData: BehaviorSubject<MemberMyDto> { get }
    var cafeAllData: BehaviorSubject<[CafeAllDto]> { get }
    var cafeNoticeData: BehaviorSubject<[CafeNoticeDto]> { get }
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
    
    // output
    
    var memberMyData: BehaviorSubject<MemberMyDto> = BehaviorSubject<MemberMyDto>(value: MemberMyDto.memberMyInitValue())
    var cafeAllData: BehaviorSubject<[CafeAllDto]> = BehaviorSubject<[CafeAllDto]>(value: CafeAllDto.cafeAllInitValue())
    var cafeNoticeData: BehaviorSubject<[CafeNoticeDto]> = BehaviorSubject<[CafeNoticeDto]>(value: CafeNoticeDto.cafeNoticeInitValue())
}
