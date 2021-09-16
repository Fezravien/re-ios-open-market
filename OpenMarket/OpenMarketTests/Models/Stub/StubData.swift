//
//  StubItems.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/08.
//

import UIKit
@testable import OpenMarket

struct StubMarketItems: Decodable { }
struct StubMarketItem: Decodable { }
struct StubMarketItemDelete: Encodable { }

enum StubRequestData {
    static let image = UIImage(named: "swift")?.pngData()
    static let password = ItemDelete(password: "1234")
    static let registrateData = ItemRegistration(title: "Hello World",
                                        descriptions: "Start Swift Programing",
                                        price: 250,
                                        currency: "KOR",
                                        stock: 2,
                                        discountedPrice: nil,
                                        images: [image!],
                                        password: "1234")
    static let editData = ItemModifcation(title: "Bye World",
                                           descriptions: "Finished Swift Programing",
                                           price: 200,
                                           currency: "KOR",
                                           stock: 1,
                                           discountedPrice: 90,
                                           images: [image!],
                                           password: "1234")
}
