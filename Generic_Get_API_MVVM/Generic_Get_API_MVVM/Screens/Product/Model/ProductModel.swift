//
//  ProductModel.swift
//  MVVM_Get_Method_Generic
//
//  Created by Mac on 15/05/23.
//

import Foundation

struct ProductModel: Decodable{
    let products: [Product]
}

struct Product: Decodable{
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
