//
//  Router.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/20/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

enum Router {
    case existingLogin
    case newLogin
    
    var scheme: String {
        switch self {
        case .existingLogin, .newLogin:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .existingLogin, .newLogin:
            return "calcmon-lvr.herokuapp.com"
        }
    }
    
    var path: String {
        switch self {
        case .existingLogin:
            return "/mobile/login"
        case .newLogin:
            return "/mobile/sign-up"
        }
    }
}
