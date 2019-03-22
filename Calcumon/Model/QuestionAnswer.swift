//
//  QuestionAnswer.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/21/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class QuestionAnswer {
    let question: String
    let answer: String
    let correctness: UIImage
    
    init(question: String, answer: String, correctness: UIImage) {
        self.question = question
        self.answer = answer
        self.correctness = correctness
    }
}
