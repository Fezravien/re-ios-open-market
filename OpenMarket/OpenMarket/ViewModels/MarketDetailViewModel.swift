//
//  MarketDetailViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/19.
//

import Foundation

final class MarketDetailViewModel {
    private var detailItemHandler: (() -> Void)?
    private(set) var detailItem: Item?
    private(set) var itemImages: [Data]? {
        didSet {
            self.detailItemHandler?()
        }
    }
    private let session: MarketSession
    
    // MARK: - initialize ViewModel
    
    init(session: MarketSession = URLSession.shared) {
        self.session = session
    }
    
    // MARK: - Set closure for data binding with DetailView
    func bindDetailItem(detailItemHandler: @escaping () -> Void) {
        self.detailItemHandler = detailItemHandler
    }
    
    // MARK: - Detial View: Model change due to the user's event.
    
    func refreshItem(item: Item) {
        self.detailItem = item
        downloadImage(imageURL: item.images ?? [])
    }
    
    // MARK: - Convert Format
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
    
    // MARK: - Network
    
    func createRequestForItemFetch(_ id: UInt) -> URLRequest? {
        let networkManager = NetworkManager(networkLoader: Network(session: session), decoder: JSONDecoder(), encoder: JSONEncoder())
        let request = networkManager.createRequest(id: id)
        return request
    }
    
    
    func createRequestForItemDelete(data: ItemDelete ,id: UInt) -> URLRequest? {
        let networkManager = NetworkManager(networkLoader: Network(session: session), decoder: JSONDecoder(), encoder: JSONEncoder())
        do {
            let request = try networkManager.createRequest(data: data, itemID: id)
            return request
        } catch {
            return nil
        }
    }
    
    
    func createRequestForItemPatch(id: UInt, item: ItemModification) throws -> URLRequest? {
        let networkManager = NetworkManager(networkLoader: Network(session: session), decoder: JSONDecoder(), encoder: JSONEncoder())
        let request = networkManager.createRequest(url: NetworkConstant.edit(id: id).url ?? URL(string: ""), encodeType: item, method: .patch)
        
        return request
        
    }
    
    func fetch<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Item?) -> ()) where T: Decodable {
        let networkManager = NetworkManager(networkLoader: Network(session: session), decoder: JSONDecoder(), encoder: JSONEncoder())
        networkManager.excuteFetch(request: request, decodeType: T.self) { result in
            switch result {
            case .success(let data):
                if let _ = data as? ItemDelete { return }
                self.detailItem = data as? Item
                completion(data as? Item)
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    private func downloadImage(imageURL: [String]) {
        //        let imageDispatchGroup = DispatchGroup()
        let imageDispatchQueue = DispatchQueue(label: "시리얼 이미지 다운로드 큐")
        var images: [Data] = []
        if imageURL.isEmpty { return }
        for index in 0..<imageURL.count {
            guard let url = URL(string: imageURL[index]) else { return }
            imageDispatchQueue.sync {
                if let image = try? Data(contentsOf: url) {
                    images.append(image)
                }
            }
        }
     
        self.itemImages = images
    }
}
