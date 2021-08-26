//
//  ItemListTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/08/26.
//

import XCTest
@testable import OpenMarket

class ItemListTest: XCTestCase {
    var jsonDecoder: JSONDecoder?
    var mockItemListAsset: Data?
    
    override func setUpWithError() throws {
        self.jsonDecoder = JSONDecoder()
        self.mockItemListAsset = NSDataAsset(name: "Items")?.data
    }

    override func tearDownWithError() throws {
        self.jsonDecoder = nil
        self.mockItemListAsset = nil
    }
    
    func test_Model_Item_Decoding_성공() {
        // given
        let mockItemInput = ItemList(page: 1, items: [ItemList.Item(id: 1,
                                                                   title: "MacBook Pro",
                                                                   price: 1690,
                                                                   currency: "USD",
                                                                   stock: 0,
                                                                   discountPrice: nil,
                                                                   thumbnails: [
                                                                    "https://camp-open-market.s3.ap-northeast-2.amazonaws.com/thumbnails/1-1.png",
                                                                    "https://camp-open-market.s3.ap-northeast-2.amazonaws.com/thumbnails/1-2.png"
                                                                ],
                                                                   registrationDate: 1611523563.7237701)])
        
        // when
        guard let data = try? jsonDecoder!.decode(Item.self, from: mockItemListAsset!) else {
            XCTAssertFalse(true)
            return
        }
        
        // then
        XCTAssertEqual(data.id, mockItemInput.items.first!.id)
        XCTAssertEqual(data.title, mockItemInput.items.first!.title)
        XCTAssertEqual(data.price, mockItemInput.items.first!.price)
        XCTAssertEqual(data.currency, mockItemInput.items.first!.currency)
        XCTAssertEqual(data.stock, mockItemInput.items.first!.stock)
        XCTAssertEqual(data.thumbnails, mockItemInput.items.first!.thumbnails)
        XCTAssertEqual(data.registrationDate, mockItemInput.items.first!.registrationDate)
    }
}
