//
//  MarketNetwork.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

struct MarketNetwork: OpenMarketNetwork {
    private let session: URLSession = .shared
    
    func excuteNetwork(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: request) { data, response, error in
            if let error = error { completion(.failure(MarketModelError.network(error))) }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(MarketModelError.casting("HTTPURLResponse")))
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                completion(.failure(MarketModelError.response(response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(MarketModelError.data))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}