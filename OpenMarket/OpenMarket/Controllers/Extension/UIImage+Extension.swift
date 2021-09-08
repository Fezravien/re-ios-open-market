//
//  UIImage+Extension.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/06.
//

import UIKit

extension UIImage {
    private func resize(percentage: CGFloat) -> UIImage? {
        let minPercentage: CGFloat = 7/10
        let size = CGSize(width: size.width * percentage, height: size.height * percentage)
        if percentage < minPercentage { return nil }
        
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    func compress() -> Data? {
        var neededCompressImage = self
        var quality: CGFloat = 1
        let maxDataSize = 300 * 1024
        guard var compressedImageData = neededCompressImage.jpegData(compressionQuality: 1) else { return nil }
        
        while compressedImageData.count > maxDataSize {
            quality *= 8/10
            if let image = neededCompressImage.resize(percentage: quality) {
                neededCompressImage = image
            }

            compressedImageData = neededCompressImage.jpegData(compressionQuality: quality) ?? Data()
        }
        
        return compressedImageData
    }
}
