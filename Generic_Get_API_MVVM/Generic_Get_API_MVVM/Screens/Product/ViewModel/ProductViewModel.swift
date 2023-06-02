//
//  ProductViewModel.swift
//  Generic_Get_API_MVVM
//
//  Created by Mac on 16/05/23.
//

import Foundation

final class ProductViewModel{
    var products: [Product] = []
    var eventHandler: ((_ event: Event)->())?
    
    func fetchProduct(){
        DispatchQueue.main.async {
            self.eventHandler?(.startLoading)
        }
        APIManager.shared.fetchAPI(
            modelType: ProductModel.self,
            type: .product
        ){ result in
            self.eventHandler?(.stopLoading)
            switch result{
            case .failure(let err) :
                self.eventHandler?(.error(err))
                break
                
            case .success(let productData) :
                self.products = productData.products
                self.eventHandler?(.reloadData)
                break
            }
        }
    }
}
