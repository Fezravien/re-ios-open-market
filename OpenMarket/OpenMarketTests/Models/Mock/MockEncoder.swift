//
//  MockEncoder.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/14.
//

import Foundation
@testable import OpenMarket

final class MockEncoder: MarketEncode {
    func encode<T>(_ value: T) throws -> Data where T : Encodable {
        return Data(try! encode(value))
    }
}
