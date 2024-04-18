//
//  StringLiterals.swift
//  Cafebara-iOS
//
//  Created by Gahyun Kim on 2024/02/22.
//

import Foundation

enum I18N {
    
    enum Common {
        static let alertContainTitle = "대타"
        static let alertName = " 님"
        static let alertLeftTitle = "할래요"
        static let alertRightTitle = "안할래요"
        static let alertLeftTitle2 = "취소할게요"
        static let alertRightTitle2 = "보낼게요"
        static let nextButtonTitle = "다음으로"
        static let tabBarhome = "홈"
        static let tabBarToDo = "투두"
        static let tabBarSchedule = "스케줄"
        static let tabBarWork = "출퇴근"
        static let tabBarMyPage = "마이페이지"
        static let tabBarMission = "미션"
    }
    
    enum OnboardingRegister {
        static let roleChoiceTitle = "안녕하세요!\n카페바라 시작 전 선택해 주세요"
        static let roleChoiceOwnerTitle = "사장이에요"
        static let roleChoiceStaffTitle = "직원이에요"
        static let nameInputOwnerTitle = "반가워요 사장님!\n사장님의 성함을 알려주세요"
        static let nameInputStaffTitle = "안녕하세요!\n다음으로 이름도 알려주세요"
        static let nameInputOwnerPlaceholer = "사장님의 성함을 입력해 주세요!"
        static let nameInputStaffPlaceholer = "실제 이름으로 입력해 주세요!"
        static let codeInputPlaceholder = "사장님께 공유 받은 초대코드를 입력해 주세요!"
        static let codeCertifyButtonTitle = "코드 인증"
        static let staffInviteCodeTitle = "반가워요!\n초대코드를 입력해 주세요"
        static let ownerInviteCodeTitle = "아래 초대코드를 통해\n함께 일하는 분들과 함께 해요"
        static let isCertifyLabelSuccess = "코드 인증 성공!"
        static let isCertifyLabelFail = "코드 인증 실패!"
        static let storeInputOwnerTitle = "고마워요 사장님!\n사장님의 가게명을 알려주세요"
        static let storeInputPlaceholder = "사장님의 가게명을 최대 18글자로 입력해 주세요!"
        static let codePastToastTitle = "초대코드가 복사되었어요"
        static let codePasteTitle = "초대코드 복사"
        static let codeShareTitle = "초대코드 공유"
        static let startButtonTitle = "시작하기"
        static let registerCompleteTitle = "사장과 직원이 함께 보는\n카페바라, 같이 시작해 보아요!"
    }
    
    enum MyWork {
        static let myWorkNavigationTitle = "나의 근무"
        static let askChangingWorkButtonTitle = "대타 요청하기"
        static let askButtonTitle = "요청 보내기"
        static let workTimeTitle = "근무시간"
        static let wokerTitle = "근무자"
        static let swungDash = "~"
        static let askReplacementNavigationTitle = "대타 요청"
        static let askReplacementButtonTitle = "요청 보내기"
        static let addAlertTitle = " 님께\n대타 요청을 보내실 건가요?"
    }
    
    enum Mission {
        static let missionNavigationTitle = "미션"
        static let routineTitle = "반복되는 루틴을 추가해 보세요!"
        static let swungDash = "~"
        static let giveMissionLabel = "미션 주기"
    }
    
    enum Routine {
        static let missionNavigationTitle = "루틴"
        static let noRoutineLabel = "아직 등록된 루틴이 없어요"
        static let addRoutineLabel = "추가"
        static let routineDeleteAlertTitle = "작성한 루틴을\n정말 삭제하실 건가요?"
    }
    
    enum Home {
        static let noticeEmptyTitle = "올라온 공지사항이 없어요."
        static let homeNavigationBarTitle = "홈"
        static let noticeTitle = "공지사항"
        static let noticeMoreButtonTitle = "더보기"
        static let todoTitle = "오늘의 할 일"
        static let todoCheckButtonTitle = "바로 확인하기"
    }
}
