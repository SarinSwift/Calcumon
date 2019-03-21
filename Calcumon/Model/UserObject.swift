//
//  UserObject.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/20/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

struct UserObject: Codable {
    let coins: Int
    let id: String
    let username: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case coins, username, password
        case id = "_id"
    }
}
