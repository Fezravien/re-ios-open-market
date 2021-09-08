//
//  MarketRequest.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/07.
//

import Foundation

protocol MarketRequest: MulitPartFormConvert {
    func createRequest<T: Encodable>(url: URL?, encodeBody body: T, method: NetworkConstant.Method) -> Result<URLRequest?, Error>
    func createMultipartFormRequest<T: Encodable>(url: URL, encodeBody body: T, method: NetworkConstant.Method) -> URLRequest
}

extension MarketRequest {
    func createRequest<T: Encodable>(url: URL?, encodeBody body: T, method: NetworkConstant.Method) -> Result<URLRequest?, Error> {
        guard let url = url else { return .failure(MarketModelError.url) }
        
        switch method {
        case .delete:
            let encode: Data
            do {
                encode = try JSONEncoder().encode(body)
            } catch {
                return .failure(MarketModelError.encoding(error))
            }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            request.httpBody = encode
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return .success(request)
        case .post:
            return .success(createMultipartFormRequest(url: url, encodeBody: body, method: .post))
        case .patch:
            return .success(createMultipartFormRequest(url: url, encodeBody: body, method: .patch))
        case .get:
            return .failure(MarketModelError.get)
        }
    }
    
    func createMultipartFormRequest<T: Encodable>(url: URL, encodeBody body: T, method: NetworkConstant.Method) -> URLRequest {
        let boundary = baseBoundary()
        let mirror = Mirror(reflecting: body)
        var bodyToDictionary: [String: Any] = [:]
        
        mirror.children.forEach {
            guard let label = $0.label else { return }
            bodyToDictionary["\(label)"] = $0.value
        }
        
        let encodeBody = createBody(dictionaryData: bodyToDictionary, boundary)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = encodeBody
        
        return request
    }
}
