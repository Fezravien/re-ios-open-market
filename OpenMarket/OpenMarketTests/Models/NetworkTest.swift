//
//  NetworkTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/10/04.
//

import XCTest
@testable import OpenMarket

class NetworkTest: XCTestCase {
    var mockSession: URLSession?
    var dummyItemList: Data?

    override func setUpWithError() throws {
        self.mockSession = MockSession.urlSession
        self.dummyItemList = NSDataAsset(name: "Items")!.data
    }

    override func tearDownWithError() throws {
        self.mockSession = nil
        self.dummyItemList = nil
    }
    
    func test_Network_isError_Fail() {
        // given
        let url = NetworkConstant.itemList(page: 1).url!
        let mockNetwork = Network(session: self.mockSession!)
        MockURLProtocol.error = MarketModelError.network
        MockURLProtocol.requestHandler = { [unowned self] request in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.dummyItemList!)
        }
        
        // when
        let expectation = XCTestExpectation(description: "Response have network error")
        
        mockNetwork.excuteNetwork(request: URLRequest(url: url)) { result in
            defer { expectation.fulfill() }
            
            // then
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                guard let error = error as? MarketModelError else {
                    XCTFail()
                    return
                }
                
                XCTAssertEqual(error.description, MarketModelError.network.description)
            }
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func test_Network_HTTPStatusCodeNot200_fail() {
        // given
        let url = NetworkConstant.itemList(page: 1).url!
        let mockNetwork = Network(session: self.mockSession!)
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { [unowned self] request in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 404,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.dummyItemList!)
        }
        
        // when
        let expectation = XCTestExpectation(description: "Response HTTPStatusCode is't 200")
        
        mockNetwork.excuteNetwork(request: URLRequest(url: url)) { result in
            defer { expectation.fulfill() }
            
            // then
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                guard let error = error as? MarketModelError else {
                    XCTFail()
                    return
                }
                
                XCTAssertEqual(error.description, MarketModelError.response(404).description)
            }
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func test_Network_Succeed() {
        // given
        let url = NetworkConstant.itemList(page: 1).url!
        let mockNetwork = Network(session: self.mockSession!)
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { [unowned self] request in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.dummyItemList!)
        }
        
        // when
        let expectation = XCTestExpectation(description: "Response Succeed")
        
        mockNetwork.excuteNetwork(request: URLRequest(url: url)) { result in
            defer { expectation.fulfill() }
            
            // then
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 3)
    }
}
