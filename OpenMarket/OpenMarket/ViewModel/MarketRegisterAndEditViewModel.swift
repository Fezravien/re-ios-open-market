//
//  MarketRegisterAndEditViewModel.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/04.
//

import UIKit

final class MarketRegisterAndEditViewModel {
    var imageChanged: () -> () = { }
    
    private var itemImage: [UIImage] = [] {
        didSet {
            self.imageChanged()
        }
    }
    
    var itemImageCount: Int { itemImage.count }
    
    func getItemImage(index: Int) -> UIImage {
        return self.itemImage[index]
    }
    
    func appendItemImage(_ image: UIImage) {
        self.itemImage.append(image)
    }
}
