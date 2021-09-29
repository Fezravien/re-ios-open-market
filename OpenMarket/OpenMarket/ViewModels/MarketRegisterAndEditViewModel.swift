//
//  MarketRegisterAndEditViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/04.
//

import UIKit

final class MarketRegisterAndEditViewModel {
    var imageChanged: () -> () = { }
    var editItemChanged: () -> () = { }
    private let networkManager = NetworkManager(loader: MarketNetwork(session: URLSession.shared), decoder: JSONDecoder(), encoder: JSONEncoder())
    private var itemImages: [UIImage] = [] {
        didSet {
            self.imageChanged()
        }
    }
    private var editItem: Item? {
        didSet {
            self.editItemChanged()
        }
    }
    
    var itemImageCount: Int { itemImages.count }
    
    func setEditItem(item: Item?) {
        guard let item = item else { return }
        self.editItem = item
    }
    
    func getEditItem() -> Item? {
        guard let item = self.editItem else { return nil }
        return item
    }
    
    func getItemImage(index: Int) -> UIImage {
        return self.itemImages[index]
    }
    
    func getItemImages() -> [Data] {
        var imageData: [Data] = []
        for image in itemImages {
            imageData.append(image.compress() ?? Data())
        }
        return imageData
    }
    
    func appendItemImage(_ image: UIImage) {
        self.itemImages.append(image)
    }
    
    func removeItemImage(index: Int) {
        self.itemImages.remove(at: index)
    }
    
    func createRequest<T: MultiPartForm>(url: URL?, type: T, method: NetworkConstant.Method) throws -> URLRequest? {
        let request: URLRequest
        do {
            request = try self.networkManager.createRequest(url: url, encodeType: type, method: method)
        } catch {
            throw MarketModelError.createRequest
        }
        
        return request
    }
    
    func post(request: URLRequest, completion: @escaping (Item?) -> ()) {
        self.networkManager.excuteFetch(request: request, decodeType: Item.self) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(_):
                completion(nil)
            }
        }
    }

    func downloadImage(imageURL: [String]) {
        var images: [UIImage] = []
        if imageURL.isEmpty { return }
        for index in 0..<imageURL.count {
            guard let url = URL(string: imageURL[index]) else { return }
            
            DispatchQueue.global(qos: .background).async {
                if let image = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        images.append(UIImage(data: image) ?? UIImage())
                        if images.count == imageURL.count {
                            self.itemImages = images
                        }
                    }
                }
            }
        }
    }
}
