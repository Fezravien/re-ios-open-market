//
//  UIImageCompressTest.swift
//  OpenMarketTests
//
//  Created by Fezravien on 2021/09/16.
//

import XCTest
@testable import OpenMarket

class UIImageCompressTest: XCTestCase {
    var image: UIImage?

    override func setUpWithError() throws {
        self.image = UIImage(named: "swift")
    }

    override func tearDownWithError() throws {
        self.image = nil
    }
    
    func test_ImageCompress_under_300KB() {
        let comporessedImage = self.image?.compress()
        XCTAssertLessThan(300, comporessedImage!.count)
    }
}
