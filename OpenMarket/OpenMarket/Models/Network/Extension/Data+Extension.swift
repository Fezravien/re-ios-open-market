//
//  Data+Extension.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/07.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        guard let data = string.data(using: .utf8) else { return }
        self.append(data)
    }
}
