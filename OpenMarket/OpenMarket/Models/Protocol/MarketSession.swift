//
//  MarketSession.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/11.
//

import Foundation

protocol MarketSession {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
