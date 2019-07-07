//
//  BlendMode.swift
//  BlendModes
//
//  Created by Vidit Bhargava on 07/07/19.
//  Copyright © 2019 Squircle Apps. All rights reserved.
//

import UIKit

public extension UIImage{
    
    func blend(filter: CGBlendMode, color: UIColor) -> UIImage? {
        
        let rect = CGRect(origin: .zero, size: self.size)
        let renderer = UIGraphicsImageRenderer(size: self.size)
        
        let image = renderer.image { context in
            color.set()
            context.fill(rect)
            draw(in: rect, blendMode: filter, alpha: 1)
        }
        
        return image
    }
}

class BlendMode {
    
    static var types: KeyValuePairs<String, CGBlendMode> = ["Normal": .normal,
                                           "Multiply": .multiply,
                                           "Screen": .screen,
                                           "Overlay": .overlay,
                                           "Darken": .darken,
                                           "Lighten": .lighten,
                                           "Color Dodge": .colorDodge,
                                           "Color Burn": .colorBurn,
                                           "Soft Light": .softLight,
                                           "Hard Light": .hardLight,
                                           "Difference": .difference,
                                           "Exclusion": .exclusion,
                                           "Hue": .hue,
                                           "Saturation":.saturation,
                                           "Color": .color,
                                           "Luminosity": .luminosity,
                                           "Clear": .clear]
}
