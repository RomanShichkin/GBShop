//
//  LoginResult.swift
//  GBShop
//
//  Created by Роман Шичкин on 05.12.2021.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
    let authToken: String
}

