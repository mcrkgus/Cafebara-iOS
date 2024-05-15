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
        setGesture()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        
        addRoutineView.routineKeyworkCollectionView.rx.itemSelected
            .bind { [weak self] indexPath in
                guard let self = self else { return }
                let cell = RoutineKeywordCollectionViewCell.dequeueReusableCell(collectionView: self.addRoutineView.routineKeyworkCollectionView, indexPath: indexPath)
                cell.isSelected = true
            }
            .disposed(by: disposeBag)
        
        addRoutineView.routineKeyworkCollectionView.rx.itemDeselected
            .bind { [weak self] indexPath in
                guard let self = self else { return }
                let cell = RoutineKeywordCollectionViewCell.dequeueReusableCell(collectionView: self.addRoutineView.routineKeyworkCollectionView, indexPath: indexPath)
                cell.isSelected = false
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
        
        addRoutineView.routineTodoTextView.rx.text.orEmpty
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                
                if text.count > 30 {
                    let index = text.index(text.startIndex, offsetBy: 30)
                    let newText = text[text.startIndex..<index]
                    self.addRoutineView.routineTodoTextView.text = String(newText)
                }
                
                if text.count == 0 && addRoutineView.routineTodoTextView.textColor == UIColor.gray7 {
                    addRoutineView.routineTodoTextViewClearButton.isHidden = true
                } else if text.count != 0 && addRoutineView.routineTodoTextView.textColor == UIColor.gray7 {
                    addRoutineView.routineTodoTextViewClearButton.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        Observable.combineLatest(addRoutineView.routineTodoTextView.rx.text.orEmpty, addRoutineView.routineKeyworkCollectionView.rx.itemSelected) { (text, indexPath) in
            return (text, indexPath)
        }
        .bind { [weak self] (text, _) in
            guard let self = self else { return }
            if self.addRoutineView.routineTodoTextView.textColor == .gray7 && !text.isEmpty {
                self.addRoutineView.changeButton.isEnabled = true
            } else {
                self.addRoutineView.changeButton.isEnabled = false
            }
        }
        .disposed(by: disposeBag)
        
        if viewModel.isEditing {
            self.addRoutineView.changeButton.setTitle(I18N.AddRoutine.changeModifyButtonTitle, for: .normal)
            self.addRoutineView.routineTodoTextView.textColor = .gray7
            self.addRoutineView.routineTodoTextView.layer.borderColor = UIColor.gray5.cgColor
            viewModel.outputs.modifyRoutineKeywordInfo
                .bind { [weak self] info in
                    guard let self = self else { return }
                    guard let info = info else { return }
                    self.addRoutineView.routineTodoTextView.text = info.routineExplain
                }
                .disposed(by: disposeBag)
        }
    }
    
    func setGesture() {
        addRoutineView.navigationBar.backButtonAction = {
            self.navigationController?.popViewController(animated: true)
        }
        
        addRoutineView.routineTodoTextViewClearButton.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                
                self.addRoutineView.routineTodoTextView.text = ""
                self.addRoutineView.routineTodoTextView.becomeFirstResponder()
            }
            .disposed(by: disposeBag)
    }
}
