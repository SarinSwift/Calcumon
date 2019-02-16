//
//  Equation.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/16/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

// struct defining variables we want to get out of Mth.ly API

struct Equation {
    let id: String
    let question: String
    let choice: [String]
    let correctChoice: Int
    let instruction: String
}
