//
//  DecodeTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/08.
//

import XCTest
@testable import OpenMarket

class DecodeTest: XCTestCase {
    var mockItems: Data?
    var mockItem: Data?
    var mockDecode: MarketDecode?

    override func setUpWithError() throws {
        mockDecode = MockDecoder()
        mockItems = NSDataAsset(name: "Items")!.data
        mockItem = NSDataAsset(name: "Item")!.data
    }

    override func tearDownWithError() throws {
        mockDecode = nil
        mockItems = nil
        mockItem = nil
    }

    func test_MarketItems_Decode_성공() {
        XCTAssertNotNil(try? mockDecode!.decode(ItemList.self, from: mockItems!))
    }
    
    func test_MarketItems_Decode_실패() {
        XCTAssertNil(try? mockDecode!.decode(MockItemList.self, from: mockItems!))
    }
    
    func test_MarketItem_Decode_성공() {
        XCTAssertNotNil(try? mockDecode!.decode(Item.self, from: mockItem!))
    }
    
    func test_MarketItem_Decode_실패() {
        XCTAssertNil(try? mockDecode!.decode(StubMarketItem.self, from: mockItem!))
    }
}
