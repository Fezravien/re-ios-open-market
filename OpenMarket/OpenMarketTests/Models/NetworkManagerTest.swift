//
//  NetworkManagerTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/15.
//

import XCTest
@testable import OpenMarket

class NetworkManagerTest: XCTestCase {
    var mockNetwork: MockNetwork?
    var mockItemList: Data?

    override func setUpWithError() throws {
        self.mockNetwork = MockNetwork()
        self.mockItemList = NSDataAsset(name: "Items")!.data
    }
    
    override func tearDownWithError() throws {
        self.mockNetwork = nil
        self.mockItemList = nil
    }
    
    func test_NetworkManager_CreateRequest_GET() {
        let networkManager = NetworkManager(loader: MockNetwork(), decoder: JSONDecoder(), encoder: JSONEncoder())
        let requestThroughManager = networkManager.createRequest(1)
        let request = URLRequest(url: NetworkConstant.itemList(page: 1).url!)
        
        XCTAssertEqual(requestThroughManager, request)
    }
    
    func test_NetworkManager_CreateRequest_DELETE() {
        let networkManager = NetworkManager(loader: MockNetwork(), decoder: JSONDecoder(), encoder: JSONEncoder())
        
        do {
            let request = try networkManager.createRequet(data: ItemDelete(password: "1234"), itemID: 1)
            XCTAssertEqual(request?.httpMethod, "DELETE")
            XCTAssertEqual(request?.allHTTPHeaderFields, ["Content-Type" : "application/json"])
        } catch {
            XCTFail()
        }
    }
    
    func test_NetworkManager_CreateRequest_MultiPartFormData_POST() {
        let networkManager = NetworkManager(loader: MockNetwork(), decoder: JSONDecoder(), encoder: JSONEncoder())
        
        do {
            let request = try networkManager.createRequest(url: NetworkConstant.registrate.url!, encodeType: StubRequestData.registrateData, method: .post)
            XCTAssertEqual(request.httpMethod, "POST")
        } catch {
            XCTFail()
        }
    }
    
    func test_NetworkManager_CreateRequest_MultiPartFormData_PATCH() {
        let networkManager = NetworkManager(loader: MockNetwork(), decoder: JSONDecoder(), encoder: JSONEncoder())
        
        do {
            let request = try networkManager.createRequest(url: NetworkConstant.edit(id: 1).url!, encodeType: StubRequestData.registrateData, method: .patch)
            XCTAssertEqual(request.httpMethod, "PATCH")
        } catch {
            XCTFail()
        }
    }
    
    func test_NetworkManager_Fetch_Succeed() {
        
        self.mockNetwork!.result = .success(mockItemList)
        let networkManager = NetworkManager(loader: self.mockNetwork!, decoder: JSONDecoder(), encoder: JSONEncoder())
        let request = networkManager.createRequest(1)!
        networkManager.excuteFetch(request: request, decodeType: ItemList.self) { result in
            switch result {
            case .success(let data):
                XCTAssertTrue(self.mockNetwork!.isCalled)
                XCTAssertNotNil(data)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func test_NetworkManager_Fetch_Failed() {
        self.mockNetwork!.result = .failure(MarketModelError.get)
        let networkManager = NetworkManager(loader: self.mockNetwork!, decoder: JSONDecoder(), encoder: JSONEncoder())
        let fetchFailURL = URL(string: "https://WrongURL")!
        let request = URLRequest(url: fetchFailURL)
        networkManager.excuteFetch(request: request, decodeType: ItemList.self) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                guard let error = error as? MarketModelError else {
                    XCTFail()
                    return
                }
                XCTAssertEqual(error.description, "⛔️ 네트워크 오류 : get")
            }
        }
    }
    
    func test_NetworkManager_Post_Succeed() {
        self.mockNetwork!.result = .success(mockItemList)
        let networkManager = NetworkManager(loader: self.mockNetwork!, decoder: JSONDecoder(), encoder: JSONEncoder())
        let request = try! networkManager.createRequest(url: NetworkConstant.registrate.url!, encodeType: StubRequestData.registrateData, method: .post)
        networkManager.excutePost(request: request) { error in
            XCTFail()
        }
    }
    
    func test_NetworkManager_Post_Fail() {
        self.mockNetwork!.result = .failure(MarketModelError.post)
        let networkManager = NetworkManager(loader: self.mockNetwork!, decoder: JSONDecoder(), encoder: JSONEncoder())
        let request = try! networkManager.createRequest(url: NetworkConstant.registrate.url!, encodeType: StubRequestData.registrateData, method: .post)
        networkManager.excutePost(request: request) { error in
            XCTAssertNotNil(error)
        }
    }
}
