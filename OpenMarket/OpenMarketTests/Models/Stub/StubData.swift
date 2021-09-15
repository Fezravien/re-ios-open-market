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

enum StubRequestData {
    static let image = UIImage(named: "kanekane")?.pngData()
    static let password = ItemDelete(password: "1234")
    static let registrateData = ItemRegistration(title: "TicTekTak",
                                        descriptions: "탁탁탁탁",
                                        price: 250,
                                        currency: "KOR",
                                        stock: 2,
                                        discountedPrice: nil,
                                        images: [image!],
                                        password: "1234")
    static let editData = ItemModifcation(title: "kanekane",
                                           descriptions: "케케케인",
                                           price: nil,
                                           currency: nil,
                                           stock: 1,
                                           discountedPrice: 90,
                                           images: nil,
                                           password: "1234")
}
