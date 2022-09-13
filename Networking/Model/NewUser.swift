//
//  NewUser.swift
//  Networking
//
//  Created by Juan Diego Marin on 12/09/22.
//

import Foundation

struct NewUser: Encodable {
    
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
}
