//
//  NetworkManager.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

final class NetworkManager {
    private let loader: MarketNetwork
    private let decoder: MarketDecode
    
    init(loader: MarketNetwork, decoder: MarketDecode) {
        self.loader = loader
        self.decoder = decoder
    }
    
    func excuteDecode<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        self.loader.excuteNetwork(request: request) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    guard let jsonDecode = try self?.decoder.decode(T.self, from: data) else { return }
                    completion(.success(jsonDecode))
                } catch {
                    completion(.failure(MarketModelError.decoding(error)))
                }
            case .failure(let error):
                completion(.failure(MarketModelError.network(error)))
            }
        }
    }
}
