//
//  LoginTest.swift
//  GBShopTests
//
//  Created by Роман Шичкин on 08.12.2021.
//

import XCTest
import Alamofire
@testable import GBShop

enum UsersApiErrorStub: Error {
    case fatalError
}

struct ErrorParseStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return UsersApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

class LoginTest: XCTestCase {
    let exectation = XCTestExpectation(description: "UsersTests")
    var errorParser: ErrorParseStub!
    let sessionManager = Session(configuration: URLSessionConfiguration.default)
    var authObject: Auth!
    var registrObjetct: Register!
    var changeUserDataObject: ChangeUserData!
    var timeout: TimeInterval = 10.0

    override func setUp() {
        errorParser = ErrorParseStub()
        authObject = Auth.init(errorParser: errorParser, sessionManager: sessionManager)
    }
    
    override func tearDown() {
        authObject = nil
        errorParser = nil
    }

    func testLogin() {
        authObject.login(userName: "test", password: "12345") { [weak self] (response: AFDataResponse<LoginResult>) in
            switch response.result {
            case .success(let loginResult):
                if loginResult.authToken.isEmpty {
                   XCTFail("Autho token is empty")
                }
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            self?.exectation.fulfill()
        }
        wait(for: [exectation], timeout: timeout)
    }
    
    func testLogout() {
        authObject.logout(userId: 123) { [weak self] (response: AFDataResponse<LogoutResult>) in
            switch response.result {
            case .success(let logoutResult):
                if logoutResult.result != 1 {
                    XCTFail("Unknown LogoutResult")
                }
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            self?.exectation.fulfill()
        }
        wait(for: [exectation], timeout: timeout)
    }

}
