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
        static let routineNavigationTitle = "루틴"
        static let noRoutineLabel = "아직 등록된 루틴이 없어요"
        static let addRoutineLabel = "추가"
        static let routineDeleteAlertTitle = "작성한 루틴을\n정말 삭제하실 건가요?"
    }
    
    enum Notice {
        static let noticeNavigationTitle = "알림"
        static let noNoticeLabel = "아직 받은 알림이 없어요"
        
        enum Staff {
            static let ownerNoticeLabel = "사장님이 공지사항을 등록했어요\n홈에서 확인해 보세요!"
            static let askNoticeLabel = "님이 대타 요청 카드를 보냈어요!"
            static let acceptionNoticeLabel = "님이 대타 요청을 수락했어요"
            static let refuseNoticeLabel = "님이 대타 요청을 거절했어요"
        }
        
        enum Owner {
            static let scheduleChangeNotice = "근무 변동이 생겼어요\n스케줄에서 변경 사항을 확인해 보세요!"
        }
    }
    
    enum Home {
        static let noticeEmptyTitle = "올라온 공지사항이 없어요."
        static let homeNavigationBarTitle = "홈"
        static let noticeTitle = "공지사항"
        static let noticeMoreButtonTitle = "더보기"
        static let todoTitle = "오늘의 할 일"
        static let todoCheckButtonTitle = "바로 확인하기"
        static let memberTitle = "근무직원"
        static let ownerHomeTitle = "사장님, 반가워요!\n카페바라와 함께 카페를 관리해 볼까요?"
        static let staffHomeTitle = "님, 반가워요!\n카페바라와 함께 카페를 관리해 볼까요?"
        static let staffMissionTitle = "님,\n사장님이 보낸 오늘의 미션이 도착했어요!"
    }
    
    enum AddRoutine {
        static let addRoutineNavigationTitle = "루틴 추가"
        static let workTitleLabel = "근무 라벨"
        static let workManualLabel = "우측 수정하기를 눌러 추가된 라벨을 수정해 보세요!"
        static let routineCategoryLabel = "루틴 항목"
        static let routineTodoTextViewPlaceholder = "해야할 일을 적어 주세요!"
        static let changeAddButtonTitle = "추가하기"
        static let changeModifyButtonTitle = "수정하기"
        static let addRoutineKeywordLabel = "새로 추가하기"
    }
    
    enum Attendance {
        static let attendanceTitle = "출퇴근"
        static let beforeWorkLabel = "출근전"
        static let workingLabel = "근무중"
        static let greetingLabel = "님, 안녕하세요!"
        static let goToWorkButtonTitle = "출근하기"
        static let goToHomeButtonTitle = "퇴근하기"
    }
    
    enum StoreManagement {
        static let exitStoreTitle = "업장 탈퇴"
        static let exitStoreExplanation = "탈퇴할 업장을 선택해주세요"
        static let exitStoreButtonTitle = "탈퇴하기"
        static let exitAlertExplanation = "선택할 업장을 탈퇴하실 건가요?\n탈퇴한 업장은 초대코드로 다시 추가 가능해요"
        static let exitButtonTitle = "할래요"
        static let cancelButtonTitle = "안할래요"
        static let exitToastMessage = "업장을 탈퇴했어요"
        static let exitWarnigToastMessage = "해당 업장은 직원이 남아있어 탈퇴할 수 없어요"
    }
    
    enum StaffManagement {
        static let staffManageTitle = "직원관리"
        static let stffManageExplanation = "직업을 관리할 업장을 선택해 주세요"
        static let selectStaffExplanation = "탈퇴할 직원을 선택해 주세요"
        static let sendOutButtonTitle = "내보내기"
        static let sendOutStaffAlertTitle = "직원 탈퇴"
        static let senfOutStaffAlertExplanation = "선택한 직원을 탈퇴시킬 건가요?\n탈퇴시킨 직원은 초대코드로 다시 추가 가능해요"
        static let exitButtonTitle = "할래요"
        static let cancelButtonTitle = "안할래요"
        static let sendOutToastMessage = "직원을 탈퇴시켰어요"
    }
}
