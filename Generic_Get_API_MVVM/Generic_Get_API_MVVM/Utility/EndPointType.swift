//
//  EndPointType.swift
//  MVVM_Get_Method_Generic
//
//  Created by Mac on 15/05/23.
//

import Foundation
enum HttpMethod: String{
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

protocol EndPointType{
    var baseUrl: String   { get }
    var path: String  { get }
    var url: URL?  { get }
    var method: HttpMethod  { get }
}

enum EndPointItems{
    case product
    case comments
    case carts
}

extension EndPointItems: EndPointType{
    var baseUrl: String {
        return "https://dummyjson.com/"
    }
    
    var path: String {
        switch self{
        case .product :
            return "products"
        case .carts :
            return "carts"
        case .comments :
            return "comments"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseUrl)\(path)")
    }
    
    var method: HttpMethod {
        switch self{
        case .product :
            return .get
        case .comments :
            return .get
        case .carts :
            return .get
        }
    }
}
