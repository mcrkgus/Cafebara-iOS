//
//  UIButton+.swift
//  Cafebara-iOS
//
//  Created by Gahyun Kim on 2024/02/23.
//

import UIKit

extension UIButton {
    
    /// Button 모서리 커스텀 - 색상, 모서리 두께, 둥근 정도
    func makeRoundBorder(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor ) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(minimumSize)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: minimumSize))
        }
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: state)
    }
    
    func alignTextBelow(spacing: CGFloat) {
        guard let image = self.imageView?.image else { return }
        guard let titleLabel = self.titleLabel else { return }
        guard let titleText = titleLabel.text else { return }
        
        let titleSize = titleText.size(withAttributes: [ NSAttributedString.Key.font: titleLabel.font as Any ])
        
        titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
        imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
    }
}
