//
//  MarketRegisterAndEditViewModelTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/10/10.
//

import XCTest
@testable import OpenMarket

class MarketRegisterAndEditViewModelTest: XCTestCase {
    var marketRegisterAndEditViewModel: MarketRegisterAndEditViewModel?
    var stubItem: Data?
    var image: UIImage?
    
    override func setUpWithError() throws {
        self.marketRegisterAndEditViewModel = MarketRegisterAndEditViewModel(session: MockSession.urlSession)
        self.stubItem = NSDataAsset(name: "Item")!.data
        self.image = UIImage(named: "swift")
    }

    override func tearDownWithError() throws {
        self.marketRegisterAndEditViewModel = nil
        self.stubItem = nil
        self.image = nil
    }

    func test_createRequest_POST_Success() {
        // given
        let url = NetworkConstant.registrate.url!
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { [unowned self] request in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.stubItem!)
        }
        
        // when
        let expectation = XCTestExpectation(description: "Register Item")
        let request = self.marketRegisterAndEditViewModel?.createRequest(url: url, type: StubRequestData.registrateData, method: .post)
        self.marketRegisterAndEditViewModel?.post(request: request!, completion: { item in
            defer { expectation.fulfill() }
            
            // then
            guard let item = item else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(item.title, "MacBook Pro")
        })
        wait(for: [expectation], timeout: 3)
    }
    
    func test_createRequest_POST_Fail() {
        // given
        let url = NetworkConstant.registrate.url!
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { [unowned self] request in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 404,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.stubItem!)
        }
        
        // when
        let expectation = XCTestExpectation(description: "Register Item")
        let request = self.marketRegisterAndEditViewModel?.createRequest(url: url, type: StubRequestData.registrateData, method: .post)
        self.marketRegisterAndEditViewModel?.post(request: request!, completion: { item in
            defer { expectation.fulfill() }
            
            // then
            XCTAssertNil(item)
        })
        wait(for: [expectation], timeout: 3)
    }
    
    func test_downloadImage_compressedImages() {
        // given
        let imageURL = ["https://camp-open-market.s3.ap-northeast-2.amazonaws.com/images/1-1.png",
                        "https://camp-open-market.s3.ap-northeast-2.amazonaws.com/images/1-2.png"]
        
        // when
        self.marketRegisterAndEditViewModel?.downloadImage(imageURL: imageURL)
        sleep(3)
        let image = self.marketRegisterAndEditViewModel?.itemImages
        
        // then
        XCTAssertNotNil(image)
//        
//        let compressedImage = self.marketRegisterAndEditViewModel?.compressedImages()
//        
//        XCTAssertLessThan(300, compressedImage!.count)
    }
}
