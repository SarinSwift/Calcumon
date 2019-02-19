//
//  CategoryCell.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/8/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: CategoryCell.self)

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageCoverView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        // convenience height constants
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        
        // delta is calculated from 0-1 from the percentage of the height change
        let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
        
        // updates the alpha based on the cell's delta. Alpha is in the range of 0.3-0.75
        let minAlpha: CGFloat = 0.0
        let maxAlpha: CGFloat = 0.6
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
        // scaling the titleLabel so it doesn't get smaller than half the size
        let scale = max(delta, 0.5)
        titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
