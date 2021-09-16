//
//  MockEncoder.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/14.
//

import Foundation
@testable import OpenMarket

final class MockEncoder: MarketEncode {
    var isCalled = false
    var inputValue: Encodable?

    func encode<T>(_ value: T) throws -> Data where T : Encodable {
        self.isCalled = true
        self.inputValue = value
        return Data()
    }
}
