//
//  ItemList.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

struct ItemList: Decodable {
    let page: UInt16
    let items: [Item]
}
