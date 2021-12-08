//
//  CatalogResult.swift
//  GBShop
//
//  Created by Роман Шичкин on 08.12.2021.
//

import Foundation

typealias CatalogArrayResult = [CatalogResult]

struct CatalogResult: Codable {
    let productId: Int
    let productName: String
    let productPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case productId = "id_product"
        case productName = "product_name"
        case productPrice = "price"
    }
    
}
