//
//  BlendCollectionViewCell.swift
//  BlendModes
//
//  Created by Vidit Bhargava on 07/07/19.
//  Copyright © 2019 Squircle Apps. All rights reserved.
//

import UIKit

class BlendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mode: UILabel!
    
    override var isSelected: Bool {
        didSet {
            
            if self.isSelected {
                self.addShadow()
                mode.font = UIFont.boldSystemFont(ofSize: 18)
                
                DispatchQueue.main.async {
                    let feedback = UIImpactFeedbackGenerator(style: .medium)
                    feedback.impactOccurred()
                }
            }
            else {
                self.addShadow(color: .clear)
                mode.font = UIFont.systemFont(ofSize: 18)
            }
        }
    }
}
