//
//  MockURLProtocol.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/14.
//

import Foundation

final class MockURLProtocol: URLProtocol {
    static var error: Error?
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.error {
            client?.urlProtocol(self, didFailWithError: error)
            return
        }
        
        guard let hander = MockURLProtocol.requestHandler else {
            assertionFailure("Received unexpected request with no handler set")
            return
        }
        
        do {
            let (response, data) = try hander(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {
        // TODO: stop loading here
    }
}
