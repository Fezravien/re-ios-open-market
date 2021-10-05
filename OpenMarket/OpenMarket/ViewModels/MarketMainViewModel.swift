//
//  OpenMarketViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

final class MarketMainViewModel {
    var observer: () -> () = { }
    private let networkManager = NetworkManager(networkLoader: Network(session: URLSession.shared), decoder: JSONDecoder(), encoder: JSONEncoder())
    private var marketItems: [Item] = [] {
        didSet {
            self.observer()
        }
    }
    private let imageCache = NSCache<NSString, NSData>()
    
    var getMarketItemsCount: Int {
        return self.marketItems.count
    }
    
    func getMarketItem(index: Int) -> Item {
        return self.marketItems[index]
    }
    
    func removeAllItems() {
        self.marketItems = []
    }
    
    func createRequest(_ page: UInt) -> URLRequest? {
        let request = self.networkManager.createRequest(page: page)
        return request
    }
    
    func downloadImage(_ imageURL: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: imageURL) else { return }
        if let imageCache = self.imageCache.object(forKey: imageURL as NSString) {
            completion(imageCache as Data)
        } else {
            DispatchQueue.global(qos: .background).async {
                guard let imageData = try? Data(contentsOf: url) else { return }
                self.imageCache.setObject(imageData as NSData, forKey: imageURL as NSString)
                completion(imageData)
            }
        }
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
