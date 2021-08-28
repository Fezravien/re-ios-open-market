//
//  OpenMarketViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

final class MarketViewModel {
    var observer: () -> () = { }
    private let networkManager = NetworkManager(loader: MarketNetwork(), decoder: JSONDecoder())
    private var marketItems: [Item] = [] {
        didSet {
            self.observer()
        }
    }
    
    func fetch(request: URLRequest, decodeType: Decodable, completion: @escaping (Result<Bool, Error>) -> Void) {
        self.networkManager.excuteDecode(request: request, decodeType: ItemList.self) { result in
            switch result {
            case .success(let data):
                self.marketItems.append(contentsOf: data.items)
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
