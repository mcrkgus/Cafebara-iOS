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
    
    // MARK: - UI Components
    
    private let homeView = HomeView()
    private let homeViewModel = HomeViewModel()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
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

    func setUI() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.isHidden = true
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
    }
    
    func setDelegate() {
        homeView.homeCalendarView.delegate = self
    }
}

extension HomeViewController: FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let day = Calendar.current.component(.weekday, from: date) - 1
        let today = Date()
        
        if Calendar.current.shortWeekdaySymbols[day] == "일" {
            return .errorBara
        } else if Calendar.current.isDate(date, inSameDayAs: today) {
            return .orange10
        } else {
            return .gray7
        }
    }
}
