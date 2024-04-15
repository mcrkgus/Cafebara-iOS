//
//  HomeView.swift
//  Cafebara-iOS
//
//  Created by 고아라 on 4/8/24.
//

import UIKit

import SnapKit
import Then
import FSCalendar

final class HomeView: UIView {
    
    // MARK: - Properties
    
    private var isOwner: Bool = false
    
    // MARK: - UI Components
    
    let navigationBar = CustomNavigationView()
    let homeCalendarView = FSCalendar(frame: .zero)
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let homeTitle = UILabel()
    private let homeImage = UIImageView(image: UIImage(resource: .profile))
    let homeDropdownView = CustomDropDownView(type: .large)
    private let noticeTitle = UILabel()
    private let noticeMoreButton = UIButton()
    lazy var noticeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let todoTitle = UILabel()
    private let todoView = UIView()
    private let todoDetailTitle = UILabel()
    private let todoImage = UIImageView(image: UIImage(resource: .profile))
    private let todoCheckButton = UIButton()
    private let memberTitle = UILabel()
    lazy var memberCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
        setReigsterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension HomeView {

    func setUI() {
        backgroundColor = .backgroundBara
    }
    
    func setStyle() {
        navigationBar.do {
            $0.isMenuButtonIncluded = true
            $0.isAlarmButtonIncluded = true
            $0.titleLabelText = I18N.Home.homeNavigationBarTitle
            $0.isTitleLabelIncluded = true
        }
        
        homeCalendarView.do {
            $0.scope = .week
            $0.backgroundColor = .backgroundBara
            $0.scrollEnabled = false
            $0.locale = Locale(identifier: "ko_KR")
            $0.appearance.weekdayFont = .fontBara(.caption2)
            $0.appearance.weekdayTextColor = .gray6
            $0.appearance.titleFont = .fontBara(.body2)
            $0.appearance.titleDefaultColor = .gray7
            $0.weekdayHeight = 13
            $0.headerHeight = 0
            $0.rowHeight = 33
            $0.allowsSelection = false
            $0.appearance.todayColor = .orangeBara
            $0.appearance.todaySelectionColor = .orange10
            $0.appearance.borderRadius = 0.6
            $0.calendarWeekdayView.weekdayLabels.first!.textColor = .errorBara
            $0.calendarWeekdayView.weekdayLabels.last!.textColor = .blueBara
            $0.appearance.eventDefaultColor = .orangeBara
            $0.appearance.eventSelectionColor = .orangeBara
        }
        
        scrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.bounces = false
            $0.showsVerticalScrollIndicator = false
        }
        
        contentView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        homeTitle.do {
            $0.textColor = .gray7
            $0.font = .fontBara(.title2)
            $0.asLineHeight(.title2)
            $0.numberOfLines = 0
        }
        
        homeDropdownView.do {
            $0.selectedViewBorderColor = .gray2
            $0.dropDownBorderColor = .gray2
            $0.font = .fontBara(.body3)
            $0.selectedItemTextColor = .blueBara
        }
        
        noticeTitle.do {
            $0.text = I18N.Home.noticeTitle
            $0.textColor = .gray7
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
        }
        
        noticeMoreButton.do {
            $0.setTitle(I18N.Home.noticeMoreButtonTitle, for: .normal)
            $0.setTitleColor(.gray3, for: .normal)
            $0.titleLabel?.font = .fontBara(.caption2)
            $0.titleLabel?.asLineHeight(.caption2)
            $0.titleLabel?.textAlignment = .right
        }
        
        noticeCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 10
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: SizeLiterals.Screen.screenWidth - 40, height: 67)
            $0.isScrollEnabled = false
            $0.showsVerticalScrollIndicator = false
            $0.isUserInteractionEnabled = false
            $0.collectionViewLayout = layout
            $0.backgroundColor = .backgroundBara
        }
        
        todoTitle.do {
            $0.text = I18N.Home.todoTitle
            $0.textColor = .gray7
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
        }
        
        todoView.do {
            $0.backgroundColor = .whiteBara
            $0.setRoundBorder(borderColor: .gray1, borderWidth: 1, cornerRadius: 10)
        }
        
        todoDetailTitle.do {
            $0.textColor = .gray7
            $0.font = .fontBara(.caption1)
            $0.asLineHeight(.caption1)
            $0.numberOfLines = 0
        }
        
        todoCheckButton.do {
            $0.setTitle(I18N.Home.todoCheckButtonTitle, for: .normal)
            $0.setTitleColor(.orangeBara, for: .normal)
            $0.setTitleColor(.gray2, for: .disabled)
            $0.titleLabel?.font = .fontBara(.caption2)
            $0.titleLabel?.asLineHeight(.caption2)
            $0.layer.borderColor = UIColor.orangeBara.cgColor
            $0.layer.borderWidth = 1
            $0.makeButtonRound(cornerRadius: 25 / 2, borderWidth: 1)
        }
        
        memberTitle.do {
            $0.text = "근무직원"
            $0.textColor = .gray7
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
        }
        
        memberCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 9
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: SizeLiterals.Screen.screenWidth - 40, height: SizeLiterals.Screen.screenHeight * 44 / 812)
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = false
            $0.isUserInteractionEnabled = false
            $0.collectionViewLayout = layout
            $0.backgroundColor = .backgroundBara
        }
    }
    
    func setHierarchy() {
        todoView.addSubviews(todoDetailTitle, todoCheckButton, todoImage)
        contentView.addSubviews(homeTitle, homeImage,
                                noticeTitle, noticeMoreButton, noticeCollectionView,
                                homeDropdownView, todoTitle, todoView,
                                memberTitle, memberCollectionView)
        scrollView.addSubview(contentView)
        addSubviews(navigationBar, homeCalendarView, scrollView)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        homeCalendarView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 37)
            $0.height.equalTo(76)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(homeCalendarView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(52)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(scrollView.snp.height)
        }
        
        homeTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        homeImage.snp.makeConstraints {
            $0.top.equalTo(homeTitle.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 40)
            $0.height.equalTo(159)
        }
        
        homeDropdownView.snp.makeConstraints {
            $0.top.equalTo(homeImage.snp.bottom).offset(-11)
            $0.leading.equalTo(homeImage)
        }
        
        noticeTitle.snp.makeConstraints {
            $0.top.equalTo(homeImage.snp.bottom).offset(79)
            $0.leading.equalTo(homeImage)
        }
        
        noticeMoreButton.snp.makeConstraints {
            $0.top.equalTo(homeImage.snp.bottom).offset(75)
            $0.trailing.equalTo(homeImage)
            $0.width.equalTo(50)
            $0.height.equalTo(30)
        }
        
        noticeCollectionView.snp.makeConstraints {
            $0.top.equalTo(noticeTitle.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 40)
            $0.height.equalTo(144)
        }
        
        todoTitle.snp.makeConstraints {
            $0.top.equalTo(noticeCollectionView.snp.bottom).offset(32)
            $0.leading.equalTo(noticeTitle)
        }
        
        todoView.snp.makeConstraints {
            $0.top.equalTo(todoTitle.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 40)
            $0.height.equalTo(120)
        }
        
        todoDetailTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.equalToSuperview().inset(20)
        }
        
        todoCheckButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(23)
            $0.leading.equalTo(todoDetailTitle)
            $0.width.equalTo(95)
            $0.height.equalTo(25)
        }
        
        todoImage.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
            $0.width.equalTo(104)
            $0.height.equalTo(88)
        }
        
        memberTitle.snp.makeConstraints {
            $0.top.equalTo(homeImage.snp.bottom).offset(79)
            $0.leading.equalTo(homeImage)
        }
        
        memberCollectionView.snp.makeConstraints {
            $0.top.equalTo(memberTitle.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 40)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setReigsterCell() {
        HomeNoticeCollectionViewCell.register(target: noticeCollectionView)
        HomeMemberScheduleCollectionViewCell.register(target: memberCollectionView)
    }
}

extension HomeView {
    
    func setHomeUI(isOwner: Bool) {
        [memberTitle, memberCollectionView].forEach {
            $0.isHidden = !isOwner
        }
        
        [noticeTitle, noticeCollectionView, noticeMoreButton, todoTitle, todoView].forEach {
            $0.isHidden = isOwner
        }
    }
    
    func bindHomeTitle(name: String) {
        homeTitle.text = isOwner ? "\(name) 사장님, 반가워요!\n카페바라와 함께 카페를 관리해 볼까요?" : "\(name) 님, 반가워요!\n카페바라와 함께 카페를 관리해 볼까요?"
        homeTitle.asColor(targetString: name, color: .blueBara)
        todoDetailTitle.text = "\(name) 님,\n사장님이 보낸 오늘의 미션이 도착했어요!"
        todoDetailTitle.asColor(targetString: name, color: .blueBara)
    }
    
    func bindHomeDropdown(cafe: [String]) {
        homeDropdownView.dataSource = cafe
    }
    
    func remakeCollectionViewHeight(cnt: Int) {
        if cnt < 2 {
            self.noticeCollectionView.snp.updateConstraints {
                $0.height.equalTo(67)
            }
        } else {
            self.noticeCollectionView.snp.updateConstraints {
                $0.height.equalTo(144)
            }
        }
    }
}
