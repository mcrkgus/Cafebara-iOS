//
//  HomeViewController.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/8/24.
//

import UIKit

import RxSwift
import RxCocoa
import FSCalendar

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private let currentDate = Date()
    private var pastWorkArray = [Date]()
    private var futureWorkArray = [Date]()
    
    // TODO: userdefault 값으로 바꾸기
    private let isOwner: Bool = true
    
    // MARK: - UI Components
    
    private let homeView = HomeView()
    private let homeViewModel = HomeViewModel()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI(isOwner: self.isOwner)
        bindViewModel()
        setDelegate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        homeView.homeDropdownView.isFirstSelected = true
    }
}

// MARK: - Extensions

extension HomeViewController {

    func setUI(isOwner: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.isHidden = true
        homeView.setHomeUI(isOwner: isOwner)
    }

    func bindViewModel() {
        homeViewModel.outputs.memberMyData
            .map { $0.memberName }
            .subscribe(onNext: { name in
                self.homeView.bindHomeTitle(name: name)
            })
            .disposed(by: disposeBag)
        
        homeViewModel.outputs.cafeAllData
            .map { cafeData in
                cafeData.map { $0.cafeName }
            }
            .subscribe(onNext: { cafe in
                self.homeView.bindHomeDropdown(cafe: cafe)
            })
            .disposed(by: disposeBag)
        
        homeViewModel.outputs.cafeNoticeData
            .bind(to: homeView.noticeCollectionView.rx
                .items(cellIdentifier: HomeNoticeCollectionViewCell.className,
                       cellType: HomeNoticeCollectionViewCell.self)) { (_, model, cell) in
                cell.configureCell(model: model)
            }
            .disposed(by: disposeBag)
        
        homeViewModel.outputs.cafeNoticeData
            .subscribe(onNext: { owner in
                self.homeView.remakeCollectionViewHeight(cnt: owner.count)
            })
            .disposed(by: disposeBag)
        
        homeViewModel.outputs.scheduleMyData
            .flatMap { cafeNoticeData -> Observable<String> in
                return Observable.from(cafeNoticeData)
                    .filter { $0.hasSchedule }
                    .map { $0.date }
            }
            .map { dateString -> Date? in
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy.MM.dd"
                if let date = dateFormatter.date(from: dateString) {
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    if let formattedDate = dateFormatter.date(from: dateFormatter.string(from: date)) {
                        return formattedDate
                    }
                }
                return nil
            }
            .subscribe(onNext: { date in
                if let date = date {
                    if date < self.currentDate {
                        self.pastWorkArray.append(date)
                    } else {
                        self.futureWorkArray.append(date)
                    }
                }
            })
            .disposed(by: disposeBag)
        
        for date in pastWorkArray {
            homeView.homeCalendarView.select(date)
        }
        
        homeViewModel.outputs.memberScheduleData
            .bind(to: homeView.memberCollectionView.rx
                .items(cellIdentifier: HomeMemberScheduleCollectionViewCell.className,
                       cellType: HomeMemberScheduleCollectionViewCell.self)) { (_, model, cell) in
                cell.configureCell(model: model)
            }
            .disposed(by: disposeBag)
    }
    
    func setDelegate() {
        homeView.homeCalendarView.delegate = self
        homeView.homeCalendarView.dataSource = self
    }
}

extension HomeViewController: FSCalendarDelegateAppearance, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let day = Calendar.current.component(.weekday, from: date) - 1
        
        if Calendar.current.isDate(date, inSameDayAs: currentDate) {
            return .orange10
        }
        if Calendar.current.shortWeekdaySymbols[day] == "일" {
            return .errorBara
        }
        if isOwner {
            return .gray7
        } else if pastWorkArray.contains(date) {
            return .orange50
        } else {
            return .gray7
        }
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleSelectionColorFor date: Date) -> UIColor? {
        if pastWorkArray.contains(date) {
            return .orange50
        } else {
            return .clear
        }
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if isOwner {
            return 0
        }
        if futureWorkArray.contains(date) {
            return 1
        } else {
            return 0
        }
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        let eventScaleFactor: CGFloat = 1.5
        cell.eventIndicator.transform = CGAffineTransform(scaleX: eventScaleFactor, y: eventScaleFactor)
    }
}
