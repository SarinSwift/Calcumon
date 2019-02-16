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
    let choice1: String
    let choice2: String
    let choice3: String
    let choice4: String
    let choice5: String
    let correctChoice: Int
    let instruction: String
}
