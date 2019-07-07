//
//  UIView+Shadow.swift
//  BlendModes
//
//  Created by Vidit Bhargava on 07/07/19.
//  Copyright © 2019 Squircle Apps. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow(color: UIColor = .black, alpha: Float = 0.25,
                   x: CGFloat = 0, y: CGFloat = 8, blur: CGFloat = 16,
                   spread: CGFloat = 0, animated: Bool = false)
    {
        
        if animated {
            let animation = CABasicAnimation(keyPath: "shadowOpacity")
            animation.fromValue = layer.shadowOpacity
            animation.toValue = alpha
            animation.duration = 0.25
            layer.add(animation, forKey: animation.keyPath)
        }
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur / 2.0
        
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
}
