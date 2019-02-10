//
//  UIImage+Decompression.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/8/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

extension UIImage {
    var decompressedImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(at: CGPoint.zero)
        guard let decompressedImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        UIGraphicsEndImageContext()
        return decompressedImage
    }
}
