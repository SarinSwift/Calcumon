//
//  MathOperator.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/23/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

enum MathOperator: String {
    case plus = "+"
    case minus = "-"
    case multiply = "*"
    case divide = "/"
    case root = "√"
    
    // random function to return a random operator
    static func random() -> MathOperator {
        let allMathOperators: [MathOperator] = [.plus, .minus, .multiply, .divide]
        let ind = Int(arc4random_uniform(UInt32(allMathOperators.count)))
        
        return allMathOperators[ind]
    }
    
    // random function to return a random plus or minus operator
    static func randomAddSub() -> MathOperator {
        let allMathOperators: [MathOperator] = [.plus, .minus]
        let ind = Int(arc4random_uniform(UInt32(allMathOperators.count)))
        
        return allMathOperators[ind]
    }
    
    // random function to return a random divide or mulitply operator
    static func randomDivMul() -> MathOperator {
        let allMathOperators: [MathOperator] = [.divide, .multiply]
        let ind = Int(arc4random_uniform(UInt32(allMathOperators.count)))
        
        return allMathOperators[ind]
    }
}
