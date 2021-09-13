//
//  MarketEncode.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/12.
//

import Foundation

protocol MarketEncode {
    func encode<T>(_ value: T) throws -> Data where T : Encodable
}
