//
//  Register.swift
//  GBShop
//
//  Created by Роман Шичкин on 05.12.2021.
//

import Foundation
import Alamofire

class Register: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Register {
    struct UserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        
        let userId: Int
        let login: String
        let password: String
        let firstName: String
        let lastName: String
        let email: String
        let gender: String
        let card: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "username": login,
                "password": password,
                "first_name": firstName,
                "last_name": lastName,
                "email": email,
                "gender": gender,
                "credit_card": card,
                "bio": bio
            ]
        }
    }
}

extension Register: RegisterRequestFactory {
    func doRegister(userId: Int,
                  login: String,
                  password: String,
                  firstName: String,
                  lastName: String? = "",
                  email: String,
                  gender: String? = "",
                  card: String? = "",
                  bio: String? = "",
                  completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
    {
        let requestModel = UserData(baseUrl: baseUrl, userId: userId, login: login, password: password, firstName: firstName, lastName: lastName ?? "", email: email, gender: gender ?? "", card: card ?? "", bio: bio ?? "")
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
