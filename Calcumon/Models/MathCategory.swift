//
//  MathCategory.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/8/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class MathCategory {
    var title: String
    var color: UIColor
    var sideImage: UIImage
    
    init(title: String, color: UIColor, sideImage: UIImage) {
        self.title = title
        self.color = color
        self.sideImage = sideImage
    }
    
//    convenience init(dictionary: NSDictionary) {
//        let title = dictionary["Title"] as? String
//        let color = dictionary["Color"] as? String
//        let sideImageName = dictionary["SideImage"] as? String
//        let sideImage = UIImage(named: sideImageName!)
//        self.init(title: title!, color: color!, sideImage: sideImage!.decompressedImage)
//    }
}
