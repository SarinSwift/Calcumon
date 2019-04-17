//
//  UserDefaults.swift
//  Calcumon
//
//  Created by Sarin Swift on 4/17/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

class UserDefaultsHelp {
    
    static func setPoints(points: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(points, forKey: "points")
        userDefaults.synchronize()
    }
}
