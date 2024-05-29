//
//  ScheduleTestViewController.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 5/25/24.
//

import UIKit

import RxSwift
import RxCocoa

final class ScheduleTestViewController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel: ScheduleReplacementViewModelType = ScheduleReplacementViewModel()
    let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let scheduleReplacementView = ScheduleReplacementView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = scheduleReplacementView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        bindViewModel()
        setDelegate()
    }
}

// MARK: - Extensions

extension ScheduleTestViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func bindViewModel() {
        viewModel.outputs.scheduleReplacementInfoData
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] data in
                guard let self = self else { return }
                if let firstData = data.first {
                    self.scheduleReplacementView.configureView(data: firstData)
                }
            })
            .disposed(by: disposeBag)
        
        scheduleReplacementView.rejectButton.rx.tap
            .bind { [weak self] in
                self?.viewModel.inputs.didTapRejectButton()
            }
            .disposed(by: disposeBag)
        
        scheduleReplacementView.acceptButton.rx.tap
            .bind { [weak self] in
                self?.viewModel.inputs.didTapAcceptButton()
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.rejectButtonTapResult
            .subscribe(onNext: { result in
                print(result)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.acceptButtonTapResult
            .subscribe(onNext: { result in
                print(result)
            })
            .disposed(by: disposeBag)
    }
    
    func setDelegate() {
        
    }
}
