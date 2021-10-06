//
//  OpenMarketViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation
import UIKit

final class MarketMainViewModel {
    private var itemListFetchHandler: (() -> Void)?
    private var itemDisplayHandler: (() -> Void)?
    private var itemImageHandler: (() -> Void)?
    private let networkManager = NetworkManager(networkLoader: Network(session: URLSession.shared), decoder: JSONDecoder(), encoder: JSONEncoder())
    private(set) var marketItems: [Item]? {
        didSet {
            self.itemListFetchHandler?()
        }
    }
    private(set) var marketItem: Item? {
        didSet {
            self.itemDisplayHandler?()
        }
    }
    private(set) var itemImage: Data? {
        didSet {
            self.itemImageHandler?()
        }
    }
    private let imageCache = NSCache<NSString, NSData>()
    
    // MARK: - Set closure for data binding with MainView
    
    func bindItemListFetch(itemListFetchHandler: @escaping () -> Void) {
        self.itemListFetchHandler = itemListFetchHandler
    }
    
    func bindItemDisplayHandler(itemDisplayHandler: @escaping () -> Void) {
        self.itemDisplayHandler = itemDisplayHandler
    }
    
    func bindItemImageHandler(itemImageHandler: @escaping () -> Void) {
        self.itemImageHandler = itemImageHandler
    }
    
    // MARK: - MainView: Model change due to the user's event.
    
    func removeAllItems() {
        self.marketItems = []
    }
    
    // MARK: - MainView Cell: Model change due to the user's event.
    
    func putItemToCell(item: Item) {
        self.marketItem = item
    }
    
    // MARK: - Convert data format
    
    func convertStockFormat(stock: UInt) -> String {
        return stock == 0 ? "품절" : "잔여수량 : \(stock)"
    }
    
    func convertPriceFormat(currency: String, price: UInt, discountPrice: UInt?) -> (price: String, discountPrice: NSMutableAttributedString?) {
        if let discountPrice = discountPrice {
            let attributeString = NSMutableAttributedString(string: "\(currency) \(price)")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            
            return ("\(currency) " + String(discountPrice), attributeString)
        } else {
            return ("\(currency) \(price)", nil)
        }
    }
    
    
    // MARK: - Networking
    
    func createRequest(_ page: UInt) -> URLRequest? {
        let request = self.networkManager.createRequest(page: page)
        return request
    }
    
    func downloadImage(_ imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        if let imageCache = self.imageCache.object(forKey: imageURL as NSString) {
            self.itemImage = imageCache as Data
        } else {
            DispatchQueue.global(qos: .background).async {
                guard let imageData = try? Data(contentsOf: url) else { return }
                self.imageCache.setObject(imageData as NSData, forKey: imageURL as NSString)
                self.itemImage = imageData
            }
        }
    }
    
    func fetch<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Error?) -> Void) where T: Decodable {
        self.networkManager.excuteFetch(request: request, decodeType: ItemList.self) { result in
            switch result {
            case .success(let data):
                self.marketItems = data.items
                completion(nil)
            case .failure(let error):
                guard let error = error as? MarketModelError else { return }
                completion(error)
            }
        }
    }
}
