//
//  MarketNetworkTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/14.
//

import XCTest
@testable import OpenMarket

class MarketNetworkTest: XCTestCase {
    var session: URLSession?
    var mockItemList: Data?
    var mockItem: Data?

    override func setUpWithError() throws {
        self.session = MockSession.urlSession
        self.mockItemList = NSDataAsset(name: "Items")!.data
        self.mockItem = NSDataAsset(name: "Item")!.data
    }

    override func tearDownWithError() throws {
        self.session = nil
        self.mockItemList = nil
        self.mockItem = nil
    }
    
    func test_Network_Success() {
        let mockNetwork = Network(session: self.session!)
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { [weak self] request in
            let response = HTTPURLResponse(url: NetworkConstant.itemList(page: 1).url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            return (response, self!.mockItemList!)
        }
        
        let expectation = XCTestExpectation(description: "Response")
    
        mockNetwork.excuteNetwork(request: URLRequest(url: NetworkConstant.itemList(page: 1).url!)) { result in
            defer { expectation.fulfill() }
            
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertNotNil(error as? MarketModelError)
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func test_Network_Fail_Response() {
        let mockNetwork = Network(session: self.session!)
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { [weak self] request in
            let response = HTTPURLResponse(url: NetworkConstant.itemList(page: 1).url!,
                                           statusCode: 404,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            return (response, self!.mockItemList!)
        }
        
        let expectation = XCTestExpectation(description: "Response")
    
        mockNetwork.excuteNetwork(request: URLRequest(url: NetworkConstant.itemList(page: 1).url!)) { result in
            defer { expectation.fulfill() }
            
            switch result {
            case .success(let data):
                XCTAssertNil(data)
            case .failure(let error):
                guard let error = error as? MarketModelError else {
                    XCTFail()
                    return
                }
                
                XCTAssertEqual(error.description, MarketModelError.response(404).description)
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
