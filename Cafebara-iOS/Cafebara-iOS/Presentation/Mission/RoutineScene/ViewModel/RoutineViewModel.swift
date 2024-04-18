//
//  RoutineViewModel.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/8/24.
//

import UIKit

import Moya
import RxSwift
import RxRelay

protocol RoutineViewModelInputs {
}

protocol RoutineViewModelOutputs {
    var routineInfo: BehaviorSubject<[SectionOfRoutine]> { get }
}

protocol RoutineViewModelType {
    var inputs: RoutineViewModelInputs { get }
    var outputs: RoutineViewModelOutputs { get }
}

final class RoutineViewModel: RoutineViewModelInputs, RoutineViewModelOutputs, RoutineViewModelType {
    
    var inputs: RoutineViewModelInputs { return self }
    var outputs: RoutineViewModelOutputs { return self }
    
    private let disposeBag = DisposeBag()
    
    // input
    
    // output
    var routineInfo = BehaviorSubject<[SectionOfRoutine]>(value: [])
    
    init() {
        let routineInfoDTO: [RoutineInfo] = [
            RoutineInfo(routineKeyword: "오픈", routineKeywordTextColor: "#DBD438", routineKeywordBackColor: "#FEFBE9", routineExplain: "원두 채우기를 해야할까 아니면 뭘해야할까나딩동댕동뿡"),
            RoutineInfo(routineKeyword: "오오오오오오", routineKeywordTextColor: "#1F9BB6", routineKeywordBackColor: "#EAFBFA", routineExplain: "원두 채우기"),
            RoutineInfo(routineKeyword: "미들", routineKeywordTextColor: "#FF4F4F", routineKeywordBackColor: "#FFF3F3", routineExplain: "미들에는 그냥 몰래몰래 쉬는거야~"),
            RoutineInfo(routineKeyword: "오픈", routineKeywordTextColor: "#DBD438", routineKeywordBackColor: "#FEFBE9", routineExplain: "원두 채우기를 해야할까 아니면 뭘 해야할까나딩동댕동뿡"),
            RoutineInfo(routineKeyword: "오오오오오오", routineKeywordTextColor: "#1F9BB6", routineKeywordBackColor: "#EAFBFA", routineExplain: "원두 채우기"),
            RoutineInfo(routineKeyword: "미들", routineKeywordTextColor: "#FF4F4F", routineKeywordBackColor: "#FFF3F3", routineExplain: "미들에는 그냥 몰래몰래 쉬는거야~"),
            RoutineInfo(routineKeyword: "오픈", routineKeywordTextColor: "#DBD438", routineKeywordBackColor: "#FEFBE9", routineExplain: "원두 채우기를 해야할까 아니면 뭘 해야할까나딩동댕동뿡"),
            RoutineInfo(routineKeyword: "오오오오오오", routineKeywordTextColor: "#1F9BB6", routineKeywordBackColor: "#EAFBFA", routineExplain: "원두 채우기"),
            RoutineInfo(routineKeyword: "미들", routineKeywordTextColor: "#FF4F4F", routineKeywordBackColor: "#FFF3F3", routineExplain: "미들에는 그냥 몰래몰래 쉬는거야~")
        ]
        routineInfo.onNext([SectionOfRoutine(items: routineInfoDTO)])
    }
}

extension RoutineViewModel {
}
