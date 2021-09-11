//
//  NetworkExchangeable.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/09.
//

import Foundation

protocol NetworkExchangeable: Codable { }
protocol NetworkRequest: NetworkExchangeable { }
protocol NetworkResponse: NetworkExchangeable { }
