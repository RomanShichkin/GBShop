//
//  ViewController.swift
//  GBShop
//
//  Created by Роман Шичкин on 28.11.2021.
//

import UIKit

class ViewController: UIViewController {

    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        auth(userName: "Somebody", password: "mypassword")
//        logout(userId: 123)
//        register()
//        changeUser()
//        catalogList()
        product()
    }

    func auth(userName: String, password: String) {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout(userId: Int) {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.logout(userId: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func register() {
        let register = requestFactory.makeRegisterRequestFactory()
        register.doRegister(userId: 123, login: "Roman", password: "qwert", firstName: "Roman", lastName: "Shichkin", email: "test@tets.test", gender: "m", card: nil, bio: nil) { response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func changeUser() {
        let change = requestFactory.makeChangeUserDataRequestFactory()
        change.doChange(userId: 123, login: "Roman", password: "qwert", firstName: "Roman", lastName: "Shichkin", email: "test@tets.test", gender: "m", card: nil, bio: nil) { response in
            switch response.result {
            case .success(let change):
                print(change)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func catalogList() {
        let goods = requestFactory.makeGoodsRequestFactory()
        goods.doCatalogList(){ response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func product() {
        let goods = requestFactory.makeGoodsRequestFactory()
        goods.doProduct(){ response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}


