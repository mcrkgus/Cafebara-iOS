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
    private let homeTitleLabel = UILabel()
    private let homeImageView = UIImageView(image: UIImage(resource: .profile))
    let homeDropdownView = CustomDropDownView(type: .large)
    private let noticeTitleLabel = UILabel()
    private let noticeMoreButton = UIButton()
    lazy var noticeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let todoTitleLabel = UILabel()
    private let todoView = UIView()
    private let todoDetailTitleLabel = UILabel()
    private let todoImageView = UIImageView(image: UIImage(resource: .profile))
    private let todoCheckButton = UIButton()
    private let memberTitleLabel = UILabel()
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
        
        homeTitleLabel.do {
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
        
        noticeTitleLabel.do {
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
        
        todoTitleLabel.do {
            $0.text = I18N.Home.todoTitle
            $0.textColor = .gray7
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
        }
        
        todoView.do {
            $0.backgroundColor = .whiteBara
            $0.setRoundBorder(borderColor: .gray1, borderWidth: 1, cornerRadius: 10)
        }
        
        todoDetailTitleLabel.do {
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
            $0.makeRoundBorder(cornerRadius: 25 / 2, borderWidth: 1.0, borderColor: UIColor.orangeBara)
        }
        
        memberTitleLabel.do {
            $0.text = I18N.Home.memberTitle
            $0.textColor = .gray7
            $0.font = .fontBara(.title3)
            $0.asLineHeight(.title3)
        }
        
        memberCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 9
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: SizeLiterals.Screen.screenWidth - 40, height: 44)
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = false
            $0.isUserInteractionEnabled = false
            $0.collectionViewLayout = layout
            $0.backgroundColor = .backgroundBara
        }
    }
    
    func setHierarchy() {
        todoView.addSubviews(todoDetailTitleLabel, todoCheckButton, todoImageView)
        contentView.addSubviews(homeTitleLabel, homeImageView,
                                noticeTitleLabel, noticeMoreButton, noticeCollectionView,
                                memberTitleLabel, memberCollectionView,
                                homeDropdownView, todoTitleLabel, todoView)
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
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.height.greaterThanOrEqualTo(self.snp.height).priority(.low)
        }
        
        homeTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        homeImageView.snp.makeConstraints {
            $0.top.equalTo(homeTitleLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 40)
            $0.height.equalTo(159)
        }
        
        homeDropdownView.snp.makeConstraints {
            $0.top.equalTo(homeImageView.snp.bottom).offset(-11)
            $0.leading.equalTo(homeImageView)
        }
        
        noticeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(homeImageView.snp.bottom).offset(79)
            $0.leading.equalTo(homeImageView)
        }
        
        noticeMoreButton.snp.makeConstraints {
            $0.top.equalTo(homeImageView.snp.bottom).offset(75)
            $0.trailing.equalTo(homeImageView)
            $0.width.equalTo(50)
            $0.height.equalTo(30)
        }
        
        noticeCollectionView.snp.makeConstraints {
            $0.top.equalTo(noticeTitleLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 40)
            $0.height.equalTo(144)
        }
        
        todoTitleLabel.snp.makeConstraints {
            $0.top.equalTo(noticeCollectionView.snp.bottom).offset(32)
            $0.leading.equalTo(noticeTitleLabel)
        }
        
        todoView.snp.makeConstraints {
            $0.top.equalTo(todoTitleLabel.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 40)
            $0.height.equalTo(120)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        todoDetailTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.equalToSuperview().inset(20)
        }
        
        todoCheckButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(23)
            $0.leading.equalTo(todoDetailTitleLabel)
            $0.width.equalTo(95)
            $0.height.equalTo(25)
        }
        
        todoImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
            $0.width.equalTo(104)
            $0.height.equalTo(88)
        }
        
        memberTitleLabel.snp.makeConstraints {
            $0.top.equalTo(homeImageView.snp.bottom).offset(79)
            $0.leading.equalTo(homeImageView)
        }
        
        memberCollectionView.snp.makeConstraints {
            $0.top.equalTo(memberTitleLabel.snp.bottom).offset(14)
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
        [memberTitleLabel, memberCollectionView].forEach {
            $0.isHidden = !isOwner
        }
        
        [noticeTitleLabel, noticeCollectionView, noticeMoreButton, todoTitleLabel, todoView].forEach {
            $0.isHidden = isOwner
        }
    }
    
    func bindHomeTitle(name: String) {
        homeTitleLabel.text = isOwner ? name + I18N.Home.ownerHomeTitle : name + I18N.Home.staffHomeTitle
        homeTitleLabel.asColor(targetString: name, color: .blueBara)
        todoDetailTitleLabel.text = name + I18N.Home.staffMissionTitle
        todoDetailTitleLabel.asColor(targetString: name, color: .blueBara)
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
