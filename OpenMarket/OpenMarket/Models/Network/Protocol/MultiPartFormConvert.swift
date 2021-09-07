//
//  MultiPartFormConvert.swift
//  OpenMarket
//
//  Created by Fezravien on 2021/09/07.
//

import Foundation

protocol MulitPartFormConvert {
    func baseBoundary() -> String
    func createBody(dictionaryData: [String: Any?], _ boundary: String) -> Data
    func convertMulitPartForm(name: String, value: Any, boundary: String) -> Data
    func convertMulitPartForm(imageName: String, images: [Data], boundary: String) -> Data
}

extension MulitPartFormConvert {
    func baseBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    func createBody(dictionaryData: [String: Any?], _ boundary: String) -> Data {
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
    
    func convertMulitPartForm(name: String, value: Any, boundary: String) -> Data {
        var element = Data()
        
        element.append("--\(boundary)\r\n")
        element.append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        element.append("\(value)\r\n")
        
        return element
    }
    
    func convertMulitPartForm(imageName: String, images: [Data], boundary: String) -> Data {
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
