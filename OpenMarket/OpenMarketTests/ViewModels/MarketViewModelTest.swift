//
//  MarketViewModelTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/10/09.
//

import XCTest
@testable import OpenMarket

class MarketViewModelTest: XCTestCase {
    var marketViewModel: MarketMainViewModel?
    var stubItemList: Data?
    
    override func setUpWithError() throws {
        self.marketViewModel = MarketMainViewModel(session: MockSession.urlSession)
        self.stubItemList = NSDataAsset(name: "Items")!.data
    }

    override func tearDownWithError() throws {
        self.marketViewModel = nil
        self.stubItemList = nil
    }

    func test_convertStockFormat_상품존재() {
        // given
        let stock: UInt = 1
        
        // when
        let convertedStock = self.marketViewModel?.convertStockFormat(stock: stock)
        
        // then
        XCTAssertEqual(convertedStock, "잔여수량 : \(stock)")
    }
    
    func test_convertStockFormat_상품품절() {
        // given
        let stock: UInt = 0
        
        // when
        let convertedStock = self.marketViewModel?.convertStockFormat(stock: stock)
        
        // then
        XCTAssertEqual(convertedStock, "품절")
    }
    
    func test_convertPriceFormat_정가() {
        // given
        let currency = "KRW"
        let price: UInt = 5500
        let discountPrice: UInt? = nil
        
        // when
        let convertedPrice = self.marketViewModel?.convertPriceFormat(currency: currency,
                                                                      price: price,
                                                                      discountPrice: discountPrice)
        
        // then
        XCTAssertEqual(convertedPrice?.price, "\(currency) \(price)")
    }
    
    func test_convertPriceFormat_할인가() {
        // given
        let currency = "KRW"
        let price: UInt = 5500
        let discountPrice: UInt? = 2500
        
        // when
        let convertedPrice = self.marketViewModel?.convertPriceFormat(currency: currency,
                                                                      price: price,
                                                                      discountPrice: discountPrice)
        
        // then
        XCTAssertEqual(convertedPrice?.price, "\(currency) \(String(discountPrice!))" )
    }
    
    func test_createRequest_fetch_appendData_Success() {
        // given
        let page: UInt = 1
        let url = NetworkConstant.itemList(page: page).url!
        let requestForTest = URLRequest(url: url)
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { [unowned self] request in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.stubItemList!)
        }
    
        // when
        let request = self.marketViewModel?.createRequest(page)
        self.marketViewModel?.fetch(request: request!, decodeType: ItemList.self, completion: {_ in
            XCTFail()
        })
        sleep(1)
        
        // then
        XCTAssertEqual(request, requestForTest)
        XCTAssertEqual(self.marketViewModel?.marketItems?.count, 20)
    }
    
    func test_createRequest_fetch_Fail() {
        // given
        let page: UInt = 1
        let url = NetworkConstant.itemList(page: page).url!
        let requestForTest = URLRequest(url: url)
        MockURLProtocol.error = MarketModelError.network
        MockURLProtocol.requestHandler = { [unowned self] request in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.stubItemList!)
        }
    
        // when
        let request = self.marketViewModel?.createRequest(page)
        self.marketViewModel?.fetch(request: request!, decodeType: ItemList.self, completion: { error in
            let error = error as! MarketModelError
            XCTAssertEqual(error.description, MarketModelError.network.description)
        })
        sleep(1)
        
        // then
        XCTAssertEqual(request, requestForTest)
        XCTAssertNil(self.marketViewModel?.marketItems?.count)
    }

    func test_downloadThumbnail_NotCache() {
        // given
        let url = "https://camp-open-market.s3.ap-northeast-2.amazonaws.com/thumbnails/1-1.png"
        
        // when
        self.marketViewModel?.downloadThumbnail(url)
        sleep(5)
        
        // then
        XCTAssertNotNil(self.marketViewModel?.itemThumbnail)
    }
}
