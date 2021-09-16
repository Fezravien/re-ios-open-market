//
//  EncodeTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/15.
//

import XCTest
@testable import OpenMarket

class EncodeTest: XCTestCase {

    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }
    
    func test_Encoder_Succeed() {
        let mockEncoder = MockEncoder()
        
        do {
            let _ = try mockEncoder.encode(StubRequestData.password)
        } catch {
            XCTFail()
        }
        
        XCTAssertEqual(mockEncoder.isCalled, true)
        XCTAssertNotNil(mockEncoder.inputValue as? ItemDelete)
    }
    
    func test_Encoder_Fail() {
        let mockEncoder = MockEncoder()
        
        do {
            let _ = try mockEncoder.encode(StubMarketItemDelete())
        } catch {
            XCTFail()
        }
        
        XCTAssertNil(mockEncoder.inputValue as? ItemDelete)
    }
}
