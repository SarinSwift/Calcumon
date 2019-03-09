//
//  ProblemGenerator.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/22/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

/*
 randomly generates math problems
*/

// Main class
class MathExpression: CustomStringConvertible {
    var lhs: MathElement
    var rhs: MathElement
    var `operator`: MathOperator
    
    var afterEqSign = 0
    
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
    
    var descriptionLinear: String {
        var leftString = ""
        var rightString = ""
        let randInt = Int.random(in: 0...100)
        // reassigned the afterEqSign to the random integer we get after the equal sign
        afterEqSign = randInt
        print("afterEqSign MathExpression: \(afterEqSign)")
        
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
        
        return "\(leftString)X \(self.operator.rawValue) \(rightString) = \(randInt)"
    }
    
    var result: Any? {
        let format = "\(lhs.nsExpressionFormatString) \(`operator`.rawValue) \(rhs.nsExpressionFormatString)"
        let expr = NSExpression(format: format)
        
        return expr.expressionValue(with: nil, context: nil)
    }
    
    
    // returns random Adding equations
    static func randomAddition() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .plus)
    }
    
    // returns random Subtracting equations
    static func randomSubtract() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .minus)
    }
    
    // returns random Dividing equations
    static func randomDivide() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(30)))
        let rhs = MathElement.Integer(value: Int.random(in: 1...15))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .divide)
    }
    
    // returns random Multiplying equations
    static func randomMultiply() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(20)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(20)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .multiply)
    }
    
    // returns random Adding/Subtracting equations
    static func randomAddSubtract() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(100)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .randomAddSub())
    }
    
    // returns random Multiply/Division equations
    static func randomDivMultiply() -> MathExpression {
        let lhs = MathElement.Integer(value: Int(arc4random_uniform(30)))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(30)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .randomDivMul())
    }
    
    // returns random plus eq to find x
    static func randomLinear() -> MathExpression {
        let lhs = MathElement.Integer(value: Int.random(in: 1...15))
        let rhs = MathElement.Integer(value: Int(arc4random_uniform(30)))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .plus)
    }
    
    // returns random Adding radicals
    static func randomAddRadicals() -> MathExpression {
        let lhs = MathElement.Root(value: Int.random(in: 1...25))
        let rhs = MathElement.Root(value: Int.random(in: 1...25))
        
        return MathExpression.init(lhs: lhs, rhs: rhs, operator: .plus)
    }
    
}
