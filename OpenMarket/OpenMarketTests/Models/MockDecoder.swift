//
//  MockDecoder.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/08.
//

import Foundation
@testable import OpenMarket

final class MockDecoder: MarketDecode {
    func decode<T>(_ type: T.Type, from: Data) throws -> T where T : Decodable {
        if type == ItemList.self {
            return ItemList(page: 1,
                               items: []) as! T
        } else if  type == Item.self {
            return Item(id: 1,
                              title: "",
                              descriptions: "",
                              price: 1,
                              currency: "",
                              stock: 1,
                              discountPrice: 1,
                              thumbnails: [],
                              images: [],
                              registrationDate: 0.0) as! T
        } else {
            throw(MarketModelError.data)
        }
    }
}

