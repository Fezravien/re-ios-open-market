//
//  NetworkConstant.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

enum NetworkConstant {
    static let baseURL = "https://camp-open-market-2.herokuapp.com"
    case itemList(page: UInt)
    case item(id: UInt)
    case registrate
    case edit(id: UInt)
    case delete(id: Int)
    
    var url: URL? {
        switch self {
        case .itemList(let page):
            return URL(string: NetworkConstant.baseURL + "/items/" + "\(page)")
        case .registrate:
            return URL(string: NetworkConstant.baseURL + "/item")
        case .item(let id):
            return URL(string: NetworkConstant.baseURL + "/item/" + "\(id)")
        case .edit(let id):
            return URL(string: NetworkConstant.baseURL + "/item/" + "\(id)")
        case .delete(let id):
            return URL(string: NetworkConstant.baseURL + "/item/" + "\(id)")
        }
    }
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
}
