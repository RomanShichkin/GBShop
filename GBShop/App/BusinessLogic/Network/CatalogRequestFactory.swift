//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by Роман Шичкин on 08.12.2021.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory: AbstractRequestFactory {
    func doCatalogList(completionHandler: @escaping (AFDataResponse<CatalogArrayResult>) -> Void)
    func doProduct(completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}
