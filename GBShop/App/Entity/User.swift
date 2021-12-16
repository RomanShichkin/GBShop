//
//  User.swift
//  GBShop
//
//  Created by Роман Шичкин on 05.12.2021.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeysUser: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
