//
//  OpenMarketNetwork.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/27.
//

import Foundation

protocol OpenMarketNetwork {
    func excuteNetwork(request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void)
}
