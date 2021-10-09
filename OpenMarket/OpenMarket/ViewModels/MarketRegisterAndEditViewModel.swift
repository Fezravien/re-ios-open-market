//
//  MarketRegisterAndEditViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/04.
//

import UIKit

final class MarketRegisterAndEditViewModel {
    private var itemImageHandler: (() -> Void)?
    private var itemForEditHandler: ((Item?) -> Void)?
    private var itemTitleHandler: ((String?) -> Void)?
    private var itemCurrencyHandler: ((String?) -> Void)?
    private var itemPriceHandler: ((String?) -> Void)?
    private var itemDiscountPriceHandler: ((String?) -> Void)?
    private var itemStockHandler: ((String?) -> Void)?
    private var itemDescriptionHandler: ((String?) -> Void)?
    private let session: MarketSession
    private(set) var itemImages: [UIImage] = [] {
        didSet {
            self.itemImageHandler?()
        }
    }
    private(set) var itemTitle: String? {
        didSet {
            self.itemTitleHandler?(itemTitle)
        }
    }
    private(set) var itemCurrency: String? {
        didSet {
            self.itemCurrencyHandler?(itemCurrency)
        }
    }
    private(set) var itemPrice: String? {
        didSet {
            self.itemPriceHandler?(itemPrice)
        }
    }
    private(set) var itemDiscountPrice: String? {
        didSet {
            self.itemDiscountPriceHandler?(itemDiscountPrice)
        }
    }
    private(set) var itemStock: String? {
        didSet {
            self.itemStockHandler?(itemStock)
        }
    }
    private(set) var itemDescription: String? {
        didSet {
            self.itemDescriptionHandler?(itemDescription)
        }
    }
    private(set) var itemForEdit: Item? {
        didSet {
            self.itemForEditHandler?(itemForEdit)
        }
    }
    
    // MARK: - initialize ViewModel
    
    init(session: MarketSession = URLSession.shared) {
        self.session = session
    }
    
    // MARK: - Set closure for data binding with RegisterAndEditView
    
    func bindItemImages(itemImageHandler: @escaping () -> Void) {
        self.itemImageHandler = itemImageHandler
    }
    
    func bindItemTitle(itemTitleHandler: @escaping (String?) -> Void) {
        self.itemTitleHandler = itemTitleHandler
    }
    
    func bindItemCurrency(itemCurrencyHandler: @escaping (String?) -> Void) {
        self.itemCurrencyHandler = itemCurrencyHandler
    }
    
    func bindItemPrice(itemPriceHandler: @escaping (String?) -> Void) {
        self.itemPriceHandler = itemPriceHandler
    }
    
    func bindItemDiscountPrice(itemDiscountPriceHandler: @escaping (String?) -> Void) {
        self.itemDiscountPriceHandler = itemDiscountPriceHandler
    }
    
    func bindItemStock(itemStockHandler: @escaping (String?) -> Void) {
        self.itemStockHandler = itemStockHandler
    }
    
    func bindItemDescription(itemDescriptionHandler: @escaping (String?) -> Void) {
        self.itemDescriptionHandler = itemDescriptionHandler
    }
    
    func bindItemForEdit(itemForEditHandler: @escaping (Item?) -> Void) {
        self.itemForEditHandler = itemForEditHandler
    }
    
    // MARK: - compress Image
    
    func getItemImages() -> [Data] {
        var imageData: [Data] = []
        for image in itemImages {
            imageData.append(image.compress() ?? Data())
        }
        return imageData
    }
    
    // MARK: - RegisterAndEditView: Model change due to the user's event.
    
    func appendItemImage(_ image: UIImage) {
        self.itemImages.append(image)
    }
    
    func removeItemImage(index: Int) {
        self.itemImages.remove(at: index)
    }
    
    func setEditItem(item: Item?) {
        guard let item = item else { return }
        self.itemForEdit = item
    }
    
    func setTitle(title: String?) {
        self.itemTitle = title
    }
    
    func setCurrency(currency: String?) {
        self.itemCurrency = currency
    }
    
    func setPrice(price: String?) {
        self.itemPrice = price
    }
    
    func setDiscountPrice(discountPrice: String?) {
        self.itemDiscountPrice = discountPrice
    }
    
    func setStock(stock: String?) {
        self.itemStock = stock
    }
    
    func setDescription(description: String?) {
        self.itemDescription = description
    }
    
    // MARK: - Networking
    
    func createRequest<T: MultiPartForm>(url: URL?, type: T, method: NetworkConstant.Method) -> URLRequest? {
        let networkManager = NetworkManager(networkLoader: Network(session: session), decoder: JSONDecoder(), encoder: JSONEncoder())
        let request = networkManager.createRequest(url: url, encodeType: type, method: method)

        return request
    }
    
    func post(request: URLRequest, completion: @escaping (Item?) -> ()) {
        let networkManager = NetworkManager(networkLoader: Network(session: session), decoder: JSONDecoder(), encoder: JSONEncoder())
        networkManager.excuteFetch(request: request, decodeType: Item.self) { result in
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
            
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
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
