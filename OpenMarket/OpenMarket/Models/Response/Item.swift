//
//  Item.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

struct Item: Decodable, Equatable {
    let id: UInt32
    let title: String
    let descriptions: String?
    let price: UInt
    let currency: String
    let stock: UInt
    let discountPrice: UInt?
    let thumbnails: [String]
    let images: [String]?
    let registrationDate: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, descriptions, price, currency, stock, thumbnails, images
        case discountPrice = "discounted_price"
        case registrationDate = "registration_date"
    }
}
