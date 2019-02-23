//
//  ProblemGenerator.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/22/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//


/*
 randomly generates math problems
 getEquation() returns a random equation
*/

import Foundation


enum MathElement: CustomStringConvertible {
    case Integer(value: Int)
    case Percentage(value: Int)
    case Expression(expression: MathExpression)
    
    var description: String {
        switch self {
        case .Integer(let value): return "\(value)"
        case .Percentage(let percentage): return "\(percentage)%"
        case .Expression(let expr): return expr.description
        }
    }
    
    var nsExpressionFormatString: String {
        switch self {
        case .Integer(let value): return "\(value).0"
        case .Percentage(let percentage): return "\(Double(percentage) / 100)"
        case .Expression(let expr): return "\(expr.description)"
        }
    }
}

enum MathOperator: String {
    case plus = "+"
    case minus = "-"
    case multiply = "X"
    case divide = "/"
    
    // random function to return a random operator
    static func random() -> MathOperator {
        let allMathOperators: [MathOperator] = [.plus, .minus, .multiply, .divide]
        let ind = Int(arc4random_uniform(UInt32(allMathOperators.count)))
        
        return allMathOperators[ind]
    }
}



// Main class
class MathExpression: CustomStringConvertible {
    var lhs: MathElement
    var rhs: MathElement
    var `operator`: MathOperator
    
    init(lhs: MathElement, rhs: MathElement, operator: MathOperator) {
        self.rhs = rhs
        self.lhs = lhs
        self.operator = `operator`
    }
    
    var description: String {
        var leftString = ""
        var rightString = ""
        
        if case .Expression(_) = lhs {
            leftString = "(\(lhs))"
        } else {
            leftString = lhs.description
        }
        if case .Expression(_) = rhs {
            rightString = "(\(rhs))"
        } else {
            rightString = rhs.description
        }
        
        return "\(leftString) \(self.operator.rawValue) \(rightString)"
    }
    
    var result: Any? {
        let format = "\(lhs.nsExpressionFormatString) \(`operator`.rawValue) \(rhs.nsExpressionFormatString)"
        let expr = NSExpression(format: format)
        
        return expr.expressionValue(with: nil, context: nil)
    }
    
    static func random() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(10)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(10)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .random())
    }
    
}


