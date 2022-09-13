//
//  User.swift
//  Networking
//
//  Created by Juan Diego Marin on 10/09/22.
//

import Foundation

struct UserResponse : Decodable {
    
    let id : Int?
    let name : String?
    let email : String?
    let gender : String?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case email
        case gender
        case status
    }
}

