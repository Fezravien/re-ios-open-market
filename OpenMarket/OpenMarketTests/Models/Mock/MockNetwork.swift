//
//  MockNetwork.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/15.
//

import Foundation
@testable import OpenMarket

final class MockNetwork: OpenMarketNetwork {
    var isCalled = false
    var result: Result<Data?, Error>?
    
    func excuteNetwork(request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void) {
        self.isCalled = true
        completion(result!)
    }
}
