//
//  MockSession.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/14.
//

import Foundation
@testable import OpenMarket

struct MockSession {
    static var urlSession: URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
}
