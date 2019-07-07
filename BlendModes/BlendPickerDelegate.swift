//
//  BlendPickerDelegate.swift
//  BlendModes
//
//  Created by Vidit Bhargava on 07/07/19.
//  Copyright © 2019 Squircle Apps. All rights reserved.
//

import Foundation
import UIKit

class BlendPickerDelegate: NSObject, UICollectionViewDelegate {

    var delegate: BlendModeDelegate?
    
     func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.apply(blendMode: BlendMode.types[indexPath.item].value)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            cell.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

protocol BlendModeDelegate: class {
    func apply(blendMode: CGBlendMode)
}

extension BlendPickerDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CollectionFlowLayout.cell(for: collectionView.frame.size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = CollectionFlowLayout.spacing*collectionView.frame.width
        let topInset = CollectionFlowLayout.spacing*collectionView.frame.height
        
        return UIEdgeInsets(top: topInset, left: inset, bottom: topInset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionFlowLayout.spacing*collectionView.frame.width
    }
}

class CollectionFlowLayout {
    
    static var spacing: CGFloat = 0.05
    static var numberOfUnits: CGFloat = 3.49
    static var numberOfInterimSpaces: Int = Int(CollectionFlowLayout.numberOfUnits)
    static var collectionHeight: CGFloat = 220
    
    
    class func cell(for size: CGSize) -> CGSize {
        let widthMultiplier = CGFloat((1 - (CGFloat(numberOfInterimSpaces + 1)*spacing)))/numberOfUnits
        var width = widthMultiplier*size.width
        
        if width >= 0.8*collectionHeight {
            width = 0.8*collectionHeight
        }
        
        return CGSize(width: width, height: width)
    }
    
}
