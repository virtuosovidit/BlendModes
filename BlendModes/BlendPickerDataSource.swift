//
//  BlendPickerCollectionViewController.swift
//  BlendModes
//
//  Created by Vidit Bhargava on 07/07/19.
//  Copyright © 2019 Squircle Apps. All rights reserved.
//

import UIKit

class BlendPickerDataSource: NSObject, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BlendMode.types.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlendCollectionViewCell", for: indexPath) as! BlendCollectionViewCell
        cell.mode.text = BlendMode.types[indexPath.item].key
    
        return cell
    }

    

}
