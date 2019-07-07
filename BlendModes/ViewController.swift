//
//  ViewController.swift
//  BlendModes
//
//  Created by Vidit Bhargava on 07/07/19.
//  Copyright © 2019 Squircle Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var blendTypes: UICollectionView!
    
    let blendDelegate = BlendPickerDelegate()
    let blendDataSource = BlendPickerDataSource()
    let Color = UIColor(named: "Color") ?? .yellow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blendDelegate.delegate = self
        blendTypes.delegate = blendDelegate
        blendTypes.dataSource = blendDataSource
        
    }

}

extension ViewController: BlendModeDelegate {
    func apply(blendMode: CGBlendMode) {
        DispatchQueue.main.async {
            self.imageView.image = UIImage(named: "mountains")?.blend(filter: blendMode, color: self.Color)
        }
    }
}
