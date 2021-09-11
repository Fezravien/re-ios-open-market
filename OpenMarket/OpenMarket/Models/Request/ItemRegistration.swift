//
//  ItemRegistration.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

struct ItemRegistration: NetworkRequest {
    let title: String
    let descriptions: String
    let price: UInt
    let currency: String
    let stock: UInt32
    let discountedPrice: UInt?
    let images: [Data]
    let password: String
}
