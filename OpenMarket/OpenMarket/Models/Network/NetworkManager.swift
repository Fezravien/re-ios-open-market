//
//  NetworkManager.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/08/26.
//

import Foundation

final class NetworkManager {
    private let networkLoader: MarketNetwork
    private let decoder: MarketDecode
    private let encoder: MarketEncode
    
    init(loader: MarketNetwork, decoder: MarketDecode, encoder: MarketEncode) {
        self.networkLoader = loader
        self.decoder = decoder
        self.encoder = encoder
    }
    
    func excuteFetch<T>(request: URLRequest, decodeType: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        self.networkLoader.excuteNetwork(request: request) { [unowned self] result in
            switch result {
            case .success(let data):
                do {
                    guard let data = data else { return }
                    let jsonDecode = try self.decoder.decode(T.self, from: data)
                    completion(.success(jsonDecode))
                } catch {
                    completion(.failure(MarketModelError.decoding))
                }
            case .failure(_):
                completion(.failure(MarketModelError.network))
            }
        }
    }
    
    /// GET - 목록 조회
    func createRequest(page: UInt) -> URLRequest? {
        guard let fetchURL = NetworkConstant.itemList(page: page).url else { return nil }
        let request = URLRequest(url: fetchURL)
        
        return request
    }
    
    /// GET - 상품 조회
    func createRequest(id: UInt) -> URLRequest? {
        guard let fetchURL = NetworkConstant.item(id: id).url else { return nil }
        let request = URLRequest(url: fetchURL)
        
        return request
    }
    
    /// DELETE - 상품 삭제 (JSONEncoder)
    func createRequest<T: Encodable>(data: T, itemID: UInt) throws -> URLRequest? {
        let encodeData: Data
        
        do {
            encodeData = try encoder.encode(data)
        } catch {
            throw MarketModelError.encoding
        }
        
        guard let deleteURL = NetworkConstant.delete(id: itemID).url else { return nil }
        var request = URLRequest(url: deleteURL)
        request.httpMethod = "DELETE"
        request.httpBody = encodeData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    /// POST, PATCH - 상품 등록/수정 (mulitpart/form-data)
    func createRequest<T: MultiPartForm>(url: URL?, encodeType: T, method: NetworkConstant.Method) -> URLRequest? {
        guard let url = url else { return nil }
            
        switch method {
        case .post:
            return createMultipartFormRequest(url: url, type: encodeType, method: .post)
        case .patch:
            return createMultipartFormRequest(url: url, type: encodeType, method: .patch)
        default :
            return nil
        }
    }
    
    private func createMultipartFormRequest<T: MultiPartForm>(url: URL, type: T, method: NetworkConstant.Method) -> URLRequest {
        let boundary = baseBoundary()
        let encodeBody = createBody(dictionaryData: type.asDictionary, boundary)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = encodeBody
        
        return request
    }
    
    private func baseBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    private func createBody(dictionaryData: [String: Any?], _ boundary: String) -> Data {
        var body = Data()
        
        for (key, value) in dictionaryData {
            if value == nil {
                continue
            } else if let value = value as? [Data] {
                body.append(convertMulitPartForm(imageName: key, images: value, boundary: boundary))
            } else if let value = value {
                body.append(convertMulitPartForm(name: key, value: value, boundary: boundary))
            }
        }
    
        body.append("--\(boundary)--\r\n")
        
        return body
    }
    
    private func convertMulitPartForm(name: String, value: Any, boundary: String) -> Data {
        var element = Data()
        
        element.append("--\(boundary)\r\n")
        element.append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        element.append("\(value)\r\n")
        
        return element
    }
    
    private func convertMulitPartForm(imageName: String, images: [Data], boundary: String) -> Data {
        var element = Data()
        
        for image in images {
            element.append("--\(boundary)\r\n")
            element.append("Content-Disposition: form-data; name=\"images[]\"; filename=\"\(imageName)\"\r\n")
            element.append("Content-Type: image/png\r\n\r\n")
            element.append(image)
            element.append("\r\n")
        }
        
        return element
    }
}
