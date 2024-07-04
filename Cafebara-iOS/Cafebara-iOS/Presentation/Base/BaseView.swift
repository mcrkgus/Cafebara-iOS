//
//  BaseView.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 7/4/24.
//

import UIKit

import UIKit

class BaseView: UIView {
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setHierarchy()
        setLayout()
        setDelegate()
        setGesture()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    func setUI() {
        
    }
    
    func setStyle() {
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setDelegate() {
        
    }
    
    func setGesture() {
        
    }
}

