//
//  MarketDetailViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/19.
//

import Foundation

final class MarketDetailViewModel {
    var detailItemObserver: () -> () = { }
    var itemImagesObserver: () -> () = { }
    private let networkManager = NetworkManager(loader: MarketNetwork(session: URLSession.shared), decoder: JSONDecoder(), encoder: JSONEncoder())
    private var detailItem: Item? {
        didSet {
            self.detailItemObserver()
        }
    }
    private var itemImages: [Data] = [] {
        didSet {
            self.itemImagesObserver()
        }
    }
    
    var getImageCount: Int {
        return self.itemImages.count
    }
    
    func getImageData(index: Int) -> Data {
        return self.itemImages[index]
    }
    
    func getDetailItem() -> Item? {
        return self.detailItem
    }
    
    func createRequest(_ id: UInt) -> URLRequest? {
        let request = self.networkManager.createRequest(id: id)
        return request
    }
    
    func fetch<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Result<Bool, Error>) -> Void) where T: Decodable {
        self.networkManager.excuteFetch(request: request, decodeType: T.self) { result in
            switch result {
            case .success(let data):
                guard let data = data as? Item else { return }
                self.detailItem = data
                self.downloadImage(imageURL: data.images ?? [])
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func downloadImage(imageURL: [String]) {
        var images: [Data] = []
        if imageURL.isEmpty { return }
        for index in 0..<imageURL.count {
            guard let url = URL(string: imageURL[index]) else { return }
            
            DispatchQueue.global(qos: .background).async {
                if let image = try? Data(contentsOf: url) {
                    images.append(image)
                    if images.count == imageURL.count {
                        self.itemImages = images
                    }
                }
            }
        }
    }
}
