//
//  OpenMarketViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

final class MarketMainViewModel {
    var observer: () -> () = { }
    private let networkManager = NetworkManager(loader: MarketNetwork(), decoder: JSONDecoder())
    private var marketItems: [Item] = [] {
        didSet {
            self.observer()
        }
    }
    
    var getMarketItemsCount: Int {
        return marketItems.count
    }
    
    func getMarketItem(index: Int) -> Item {
        return marketItems[index]
    }
    
    func fetch<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Result<Bool, Error>) -> Void) where T: Decodable {
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
