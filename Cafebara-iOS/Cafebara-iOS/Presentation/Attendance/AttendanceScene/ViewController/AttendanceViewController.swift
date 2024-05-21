//
//  AttendanceViewController.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/20/24.
//

import UIKit

import RxCocoa
import RxDataSources
import RxSwift

final class AttendanceViewController: UIViewController {
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let attendanceView = AttendanceView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = attendanceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setGesture()
    }
}

// MARK: - Extensions

extension AttendanceViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setGesture() {
        attendanceView.startWorkButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handleAttendanceButtonTap()
            })
            .disposed(by: disposeBag)
        
        attendanceView.finishWorkButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handleAttendanceButtonTap()
            })
            .disposed(by: disposeBag)
    }
    
    private func handleAttendanceButtonTap() {
        attendanceView.isWorking.toggle()
        attendanceView.updateStaus()
    }
}
