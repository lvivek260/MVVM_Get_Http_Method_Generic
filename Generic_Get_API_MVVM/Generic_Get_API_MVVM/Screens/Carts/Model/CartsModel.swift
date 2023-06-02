//
//  CartsModel.swift
//  MVVM_Get_Method_Generic
//
//  Created by Mac on 15/05/23.
//

import Foundation

struct CartsModel: Decodable{
    let carts: [Carts]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Carts: Decodable{
    let id: Int
    let products: [CartsProduct]
    let total: Int
    let discountedTotal: Int
    let userId: Int
    let totalProducts: Int
    let totalQuantity: Int
}

struct CartsProduct: Decodable{
    let id: Int
    let title: String
    let price: Int
    let quantity: Int
    let total: Int
    let discountPercentage: Double
    let discountedPrice: Int
}
