//
//  NetworkManagerTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/15.
//

import XCTest
@testable import OpenMarket

class NetworkManagerTest: XCTestCase {
    var sutNetworkManger: NetworkManager?
    var mockNetwork: Network?
    var stubItemsList = NSDataAsset(name: "Items")!.data
    var stubItem = NSDataAsset(name: "Item")!.data

    override func setUpWithError() throws {
        self.mockNetwork = Network(session: MockSession.urlSession)
        self.sutNetworkManger = NetworkManager(networkLoader: self.mockNetwork!,
                                               decoder: MockDecoder(),
                                               encoder: MockEncoder())
    }
    
    override func tearDownWithError() throws {
        self.mockNetwork = nil
        self.sutNetworkManger = nil
    }
    
    // MARK: - GET
    
    func test_createRequest_GET_목록조회() {
        // given
        let itemListURL = NetworkConstant.itemList(page: 1).url
        
        // when
        let request = sutNetworkManger!.createRequest(page: 1)
        
        // then
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url, itemListURL)
    }
    
    func test_createRequest_GET_상품조회() {
        // given
        let itemURL = NetworkConstant.item(id: 1).url
        
        // when
        let request = sutNetworkManger!.createRequest(id: 1)
        
        // then
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url, itemURL)
    }
    
    // MARK: - POST, PATCH
    
    func test_createRequest_POST_상품등록() {
        // given
        let itemRegistrationURL = NetworkConstant.registrate.url
        
        // when
        let request = sutNetworkManger?.createRequest(url: itemRegistrationURL, encodeType: StubRequestData.registrateData, method: .post)
        
        // then
        XCTAssertNotNil(request)
        
        XCTAssertEqual(request?.url, itemRegistrationURL)
        XCTAssertEqual(request?.httpMethod, NetworkConstant.Method.post.rawValue)
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Content-Type")?.components(separatedBy: ";").first, "multipart/form-data")
    }
    
    func test_createRequest_PATCH_상품수정() {
        // given
        let itemModificationURL = NetworkConstant.edit(id: 1).url
        
        // when
        let request = sutNetworkManger?.createRequest(url: itemModificationURL, encodeType: StubRequestData.editData, method: .patch)
        
        // then
        XCTAssertNotNil(request)
        
        XCTAssertEqual(request?.url, itemModificationURL)
        XCTAssertEqual(request?.httpMethod, NetworkConstant.Method.patch.rawValue)
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Content-Type")?.components(separatedBy: ";").first, "multipart/form-data")
    }
    
    // MARK: - DELETE
    
    func test_createRequest_DELETE_상품삭제() {
        // given
        let itemDeleteURL = NetworkConstant.delete(id: 1).url
        
        // when
        do {
            let request = try sutNetworkManger?.createRequest(data: StubRequestData.password, itemID: 1)
            
            // then
            XCTAssertNotNil(request)
            
            XCTAssertEqual(request?.url, itemDeleteURL)
            XCTAssertEqual(request?.httpMethod, NetworkConstant.Method.delete.rawValue)
            XCTAssertEqual(request?.allHTTPHeaderFields, ["Content-Type" : "application/json"])
        } catch {
            XCTFail()
        }
    }
    
    func test_excuteFetch_Success() {
        // given
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: NetworkConstant.itemList(page: 1).url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.stubItemsList)
        }
        let request = sutNetworkManger!.createRequest(page: 1)!
        
        // when
        sutNetworkManger?.excuteFetch(request: request, decodeType: ItemList.self, completion: { result in
            // then
            switch result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
        })
    }
    
    func test_excuteFetch_Decode_Fail() {
        // given
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: NetworkConstant.itemList(page: 1).url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.stubItemsList)
        }
        let request = sutNetworkManger!.createRequest(page: 1)!
        
        // when
        sutNetworkManger?.excuteFetch(request: request, decodeType: StubMarketItems.self, completion: { result in
            // then
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                guard let error = error as? MarketModelError else {
                    XCTFail()
                    return
                }
                XCTAssertEqual(error.description, MarketModelError.decoding.description)
            }
        })
    }
    
    func test_excuteFetch_Network_Fail() {
        // given
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: NetworkConstant.itemList(page: 1).url!,
                                           statusCode: 404,
                                           httpVersion: nil,
                                           headerFields: ["Content-Type": "application/json"])!
            
            return (response, self.stubItemsList)
        }
        
        let request = sutNetworkManger!.createRequest(page: 1)!
        
        // when
        sutNetworkManger?.excuteFetch(request: request, decodeType: ItemList.self, completion: { result in
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
        })
        
    }
}
