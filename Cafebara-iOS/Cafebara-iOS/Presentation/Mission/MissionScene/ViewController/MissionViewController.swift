//
//  MissionViewController.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/1/24.
//

import UIKit

import RxCocoa
import RxDataSources
import RxSwift

final class MissionViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel = MissionViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let missionView = MissionView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = missionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        bindViewModel()
        setGesture()
    }
}

// MARK: - Extensions

extension MissionViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func bindViewModel() {
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionOfStaffMission>(
            configureCell: { (_, collectionView, indexPath, item) in
                let cell = StaffMissionCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
                cell.configureCell(data: item)
                
                return cell
            },
            configureSupplementaryView: { (dataSource, collectionView, _, indexPath) in
                let headerView = StaffMissionCollectionHeaderView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
                headerView.configureView(data: dataSource[indexPath.section].header)
                
                return headerView
            }
        )
        
        viewModel.outputs.staffMissionInfo
            .bind(to: missionView.staffMissionCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    func setGesture() {
        missionView.routineButton.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.missionView.setHiddenRoutineInfo()
            }
            .disposed(by: disposeBag)
    }
}
