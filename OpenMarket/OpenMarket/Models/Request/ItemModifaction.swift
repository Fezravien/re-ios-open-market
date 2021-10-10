//
//  ItemModifaction.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

struct ItemModification: MultiPartForm {
    let title: String?
    let descriptions: String?
    let price: UInt?
    let currency: String?
    let stock: UInt?
    let discountedPrice: UInt?
    let images: [Data]?
    let password: String
    
    var asDictionary: [String : Any?] {
        [
            "title": self.title,
            "descriptions": self.descriptions,
            "price": self.price,
            "currency": self.currency,
            "stock": self.stock,
            "discounted_price": self.discountedPrice,
            "images": self.images,
            "password": self.password
        ]
    }
}
