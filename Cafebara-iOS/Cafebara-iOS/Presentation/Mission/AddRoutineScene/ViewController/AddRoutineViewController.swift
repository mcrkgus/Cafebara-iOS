//
//  AddRoutineViewController.swift
//  Cafebara-iOS
//
//  Created by 강민수 on 4/15/24.
//

import UIKit

import RxCocoa
import RxSwift

final class AddRoutineViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: RoutineViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let addRoutineView = AddRoutineView()
    
    // MARK: - Life Cycles
    
    init(viewModel: RoutineViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = addRoutineView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        bindViewModel()
        setDelegate()
    }
}

// MARK: - Extensions

extension AddRoutineViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func bindViewModel() {
        viewModel.outputs.routineKeywordInfo
            .bind(to: addRoutineView.routineKeyworkCollectionView.rx.items) { collectionView, index, item in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = RoutineKeywordCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
                cell.configureCell(data: item)
                
                return cell
            }
            .disposed(by: disposeBag)
        
        addRoutineView.routineTodoTextView.rx.didBeginEditing
            .bind { [weak self] _ in
                guard let self = self else { return }
                if addRoutineView.routineTodoTextView.textColor == UIColor.gray2 {
                    self.addRoutineView.routineTodoTextView.text = nil
                    self.addRoutineView.routineTodoTextView.textColor = .gray7
                    self.addRoutineView.routineTodoTextView.layer.borderColor = UIColor.gray5.cgColor
                }
            }
            .disposed(by: disposeBag)
        
        addRoutineView.routineTodoTextView.rx.didEndEditing
            .bind { [weak self] _ in
                guard let self = self else { return }
                if addRoutineView.routineTodoTextView.text.isEmpty {
                    self.addRoutineView.routineTodoTextView.text = I18N.AddRoutine.routineTodoTextViewPlaceholder
                    self.addRoutineView.routineTodoTextView.textColor = .gray2
                    self.addRoutineView.routineTodoTextView.layer.borderColor = UIColor.gray1.cgColor
                }
            }
            .disposed(by: disposeBag)
    }
    
    func setDelegate() {
//        RoutineKeywordCollectionViewCell.register(target: addRoutineView.routineKeyworkCollectionView)
    }
}
