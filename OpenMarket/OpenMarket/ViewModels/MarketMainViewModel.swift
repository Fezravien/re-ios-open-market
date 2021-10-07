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
    private var itemImageHandler: (() -> Void)?
    private let session: MarketSession
    private(set) var marketItems: [Item]? {
        didSet {
            self.itemListFetchHandler?()
        }
    }
    private(set) var itemThumbnail: Data? {
        didSet {
            self.itemImageHandler?()
        }
    }
    private(set) var marketItem: Item?
    private(set) var imageCache = NSCache<NSString, NSData>()
    
    // MARK: - initialize ViewModel
    
    init(session: MarketSession = URLSession.shared) {
        self.session = session
    }
    
    // MARK: - Set closure for data binding with MainView
    
    func bindItemListFetch(itemListFetchHandler: @escaping () -> Void) {
        self.itemListFetchHandler = itemListFetchHandler
    }
    
    func bindThumbnailHandler(itemImageHandler: @escaping () -> Void) {
        self.itemImageHandler = itemImageHandler
    }
    
    // MARK: - MainView: Model change due to the user's event.
    
    func removeAllItems() {
        self.marketItems = []
    }
    
    // MARK: - MainView Cell: Model change due to the user's event.
    
    func itemForCell(item: Item) {
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
        let networkManager = NetworkManager(networkLoader: Network(session: self.session), decoder: JSONDecoder(), encoder: JSONEncoder())
        let request = networkManager.createRequest(page: page)
        return request
    }
    
    func downloadThumbnail(_ imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        if let imageCache = self.imageCache.object(forKey: imageURL as NSString) {
            self.itemThumbnail = imageCache as Data
        } else {
            DispatchQueue.global(qos: .background).async {
                guard let imageData = try? Data(contentsOf: url) else { return }
                self.imageCache.setObject(imageData as NSData, forKey: imageURL as NSString)
                self.itemThumbnail = imageData
            }
        }
    }
    
    func fetch<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Error?) -> Void) where T: Decodable {
        let networkManager = NetworkManager(networkLoader: Network(session: self.session), decoder: JSONDecoder(), encoder: JSONEncoder())
        networkManager.excuteFetch(request: request, decodeType: ItemList.self) { result in
            switch result {
            case .success(let data):
                if self.marketItems == nil {
                    self.marketItems = data.items
                    return
                }
                self.marketItems?.append(contentsOf: data.items)
                completion(nil)
            case .failure(let error):
                guard let error = error as? MarketModelError else { return }
                completion(error)
            }
        }
    }
}
