//
//  StringExt.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/28/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

extension String {
    
    // Checks if the string has at least one letter!
    var isContainsLetters: Bool {
        let letters = CharacterSet.letters
        return self.rangeOfCharacter(from: letters) != nil
    }
    
}
