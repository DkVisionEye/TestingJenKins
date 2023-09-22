//
//  Models.swift
//  MVVM_RND
//
//  Created by Rahul Vishwakarma on 08/09/23.
//

import Foundation


// MARK: - DummyCartModel
struct DummyCartModel: Codable {
    let carts: [Cart]
    let total, skip, limit: Int
}

// MARK: - Cart
struct Cart: Codable {
    let id: Int
    let products: [Product]
    let total, discountedTotal, userID, totalProducts: Int
    let totalQuantity: Int

    enum CodingKeys: String, CodingKey {
        case id, products, total, discountedTotal
        case userID = "userId"
        case totalProducts, totalQuantity
    }
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title: String
    let price, quantity, total: Int
    let discountPercentage: Double
    let discountedPrice: Int
}
