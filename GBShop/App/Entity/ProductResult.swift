//
//  ProductResult.swift
//  GBShop
//
//  Created by Роман Шичкин on 08.12.2021.
//

import Foundation

struct ProductResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
        case result = "result"
    }
    
}
