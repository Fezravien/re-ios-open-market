//
//  MainSceneDelegate.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/10/06.
//

import Foundation

protocol MainSceneDelegate: AnyObject {
    func stopIndicater()
    func displayRegisteratedItem(item: Item)
    func refreshMainItemList()
}
