//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Роман Шичкин on 05.12.2021.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func doChange(userId: Int,
                login: String,
                password: String,
                firstName: String,
                lastName: String?,
                email: String,
                gender: String?,
                card: String?,
                bio: String?,
                completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void) -> Void
}
