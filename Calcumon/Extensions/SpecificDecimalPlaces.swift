//
//  SpecificDecimalPlaces.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/25/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation


extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
