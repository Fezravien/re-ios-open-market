//
//  OpenMarketViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

final class MarketMainViewModel {
    var observer: () -> () = { }
    private let networkManager = NetworkManager(loader: MarketNetwork(session: URLSession.shared), decoder: JSONDecoder(), encoder: JSONEncoder())
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
    
    func createRequest(_ page: UInt) -> URLRequest? {
        let request = self.networkManager.createRequest(page: page)
        return request
    }
    
    func fetch<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Result<Bool, Error>) -> Void) where T: Decodable {
        self.networkManager.excuteFetch(request: request, decodeType: ItemList.self) { result in
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
