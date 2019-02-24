//
//  MathElement.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/23/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

enum MathElement: CustomStringConvertible {
    case Integer(value: Int)                            // (value: Int(5)) -> 5
    case Percentage(value: Int)                         // (value: Int(82) -> 82%
    case Expression(expression: MathExpression)         // (expression: MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 4), operator: .plus)) -> (3 + 4)
    case Root(value: Int)
    
    var description: String {
        switch self {
        case .Integer(let value): return "\(value)"
        case .Percentage(let percentage): return "\(percentage)%"
        case .Expression(let expr): return expr.description
        case .Root(let root): return "√\(root)"
        }
    }
    
    var nsExpressionFormatString: String {
        switch self {
        case .Integer(let value): return "\(value).0"
        case .Percentage(let percentage): return "\(Double(percentage) / 100)"
        case .Expression(let expr): return "\(expr.description)"
        case .Root(let root): return "√\(root)"
        }
    }
}
