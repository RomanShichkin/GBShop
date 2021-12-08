//
//  Goods.swift
//  GBShop
//
//  Created by Роман Шичкин on 08.12.2021.
//

import Foundation
import  Alamofire

class Goods: AbstractRequestFactory{
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility))
    {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Goods{
    struct goodsData: RequestRouter{
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "catalogData.json"
        var parameters: Parameters? = nil
    }
    
    struct goodsById: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getGoodById.json"
        var parameters: Parameters? = nil
    }
}

extension Goods: CatalogRequestFactory{
    
    func doCatalogList(completionHandler: @escaping (AFDataResponse<CatalogArrayResult>) -> Void) {
        let requestModel = goodsData(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func doProduct(completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let requestModel = goodsById(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    
}
