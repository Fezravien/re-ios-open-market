//
//  OpenMarketDecode.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/27.
//

import Foundation

protocol MarketDecode {
    func decode<T>(_ type: T.Type, from: Data) throws -> T where T : Decodable
}
