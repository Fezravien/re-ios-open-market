//
//  ItemList.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

struct ItemList: Decodable {
    let page: UInt16
    let items: [Item]
    
    struct Item: Decodable {
        let id: UInt32
        let title: String
        let price: UInt
        let currency: String
        let stock: UInt
        let discountPrice: UInt?
        let thumbnails: [String]
        let registrationDate: Double
        
        enum CodingKeys: String, CodingKey {
            case id, title, price, currency, stock, thumbnails
            case discountPrice = "discounted_price"
            case registrationDate = "registration_date"
        }
    }
}
