//
//  NoticeCollectionViewCell.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/8/24.
//

import UIKit

import SnapKit
import Then
import RxSwift

final class NoticeCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static let isFromNib: Bool = false
    var isOwner: Bool = false
    var disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let contentsView = UIView()
    private let noticeLabel = UILabel()
    private let noticeDateLabel = UILabel()
    private let noticeIcon = UIImageView()
    private let dividerLine = UIView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension NoticeCollectionViewCell {
    
    func setUI() {
        backgroundColor = .clear
    }
    
    func setStyle() {
        contentsView.do {
            $0.backgroundColor = .clear
        }
        
        noticeLabel.do {
            if isOwner {
                $0.text = I18N.Notice.Owner.scheduleChangeNotice
            }
            else {
                $0.text = I18N.Notice.Staff.ownerNoticeLabel
            }
            //TODO: 서버작업시 텍스트 변경
            $0.font = .fontBara(.body1)
            $0.asLineHeight(.body1)
            $0.lineBreakMode = .byCharWrapping
            $0.numberOfLines = 2
            $0.textColor = .gray7
        }
        
        noticeDateLabel.do {
            $0.text = "2024.02.14"
            //TODO: 서버작업시 텍스트 변경
            $0.font = .fontBara(.body4)
            $0.asLineHeight(.body4)
            $0.textColor = .gray3
        }
        
        noticeIcon.do {
            $0.image = .icNoticeOrange
            $0.contentMode = .scaleAspectFit
            $0.isHidden = false
        }
        
        dividerLine.do {
            $0.backgroundColor = .gray1
        }
    }
    
    func setHierarchy() {
        addSubviews(contentsView)
        contentsView.addSubviews(noticeIcon,
                    noticeLabel,
                    noticeDateLabel,
                    dividerLine)
    }
    
    func setLayout() {
        contentsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        noticeIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(60)
            $0.trailing.equalToSuperview().inset(99)
        }
        
        noticeDateLabel.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(60)
            $0.trailing.equalToSuperview().inset(249)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        dividerLine.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
    }
}

extension NoticeCollectionViewCell {
    
    func configureCell(data: NoticeInfo) {
        if isOwner {
            noticeIcon.image = .icNoticeOrange
        }
        else {
            noticeDateLabel.text = convertToDateStr(dateComponents: data.date)
            if data.noticeType == "a" {
                noticeLabel.text = I18N.Notice.Staff.ownerNoticeLabel
                noticeIcon.image = .icNoticeOrange
            } else  if data.noticeType == "b" {
                noticeLabel.text = data.staffName + I18N.Notice.Staff.acceptionNoticeLabel
                noticeIcon.image = .icCalenderBlue
            }
        }
    }
    //TODO: API 명세서 확인 후 변동
}

func convertToDateStr(dateComponents: [Int]) -> String? {
    let year = dateComponents[0]
    let month = dateComponents[1]
    let day = dateComponents[2]
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: "\(year)-\(month)-\(day)")
    
    if let date = date {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    } else {
        return nil
    }
}
