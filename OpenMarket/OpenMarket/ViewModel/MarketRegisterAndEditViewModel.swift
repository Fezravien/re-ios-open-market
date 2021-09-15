//
//  MarketRegisterAndEditViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/04.
//

import UIKit

final class MarketRegisterAndEditViewModel {
    var imageChanged: () -> () = { }
    private let networkManager = NetworkManager(loader: MarketNetwork(session: URLSession.shared), decoder: JSONDecoder(), encoder: JSONEncoder())
    private var itemImage: [UIImage] = [] {
        didSet {
            self.imageChanged()
        }
    }
    
    var itemImageCount: Int { itemImage.count }
    
    func getItemImage(index: Int) -> UIImage {
        return self.itemImage[index]
    }
    
    func getItemImages() -> [Data] {
        var imageData: [Data] = []
        for image in itemImage {
            imageData.append(image.compress() ?? Data())
        }
        return imageData
    }
    
    func appendItemImage(_ image: UIImage) {
        self.itemImage.append(image)
    }
    
    func createRequest<T: MultiPartForm>(url: URL?, type: T, method: NetworkConstant.Method) throws -> URLRequest? {
        let request: URLRequest
        do {
            request = try self.networkManager.createRequest(url: url, encodeType: type, method: .post)
        } catch {
            throw MarketModelError.createRequest
        }
        
        return request
    }
    
    func post<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Result<Bool, Error>) -> Void) where T: Decodable {
        self.networkManager.excuteFetch(request: request, decodeType: decodeType) { result in
            switch result {
            case .success(_):
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func patch() {
        
    }
}
