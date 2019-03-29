//
//  AllMonstersCell.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/25/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class AllMonstersCell: UICollectionViewCell {
    
    @IBOutlet weak var monsterImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
