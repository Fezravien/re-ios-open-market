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
    
    func getImageDatas() -> [Data] {
        return self.itemImages
    }
    
    func getDetailItem() -> Item? {
        return self.detailItem
    }
    
    func createRequestForItemFetch(_ id: UInt) -> URLRequest? {
        let request = self.networkManager.createRequest(id: id)
        return request
    }
    
    func createRequestForItemDelete(data: ItemDelete ,id: UInt) -> URLRequest? {
        do {
            let request = try self.networkManager.createRequest(data: data, itemID: id)
            return request
        } catch {
            return nil
        }
    }
    
    func createRequestForItemPatch(id: UInt, item: ItemModifcation) throws -> URLRequest? {
        do {
            let request = try self.networkManager.createRequest(url: NetworkConstant.edit(id: id).url ?? URL(string: ""), encodeType: item, method: .patch)
            return request
        } catch {
            return nil
        }
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
    
    func patch(request: URLRequest, completion: @escaping (Result<Bool,Error>) -> Void) {
        self.networkManager.excutePost(request: request) { result in
            switch result {
            case .success(_):
                completion(.success(true))
            case .failure(_):
                completion(.failure(MarketModelError.patch))
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
