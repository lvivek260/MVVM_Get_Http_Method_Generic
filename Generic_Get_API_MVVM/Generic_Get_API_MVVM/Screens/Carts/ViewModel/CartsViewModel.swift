//
//  CartsViewModel.swift
//  Generic_Get_API_MVVM
//
//  Created by Mac on 16/05/23.
//

import Foundation

final class CartsViewModel{
    var carts: [Carts] = []
    var eventHandler: ((_ event: Event)->())?
    
    func fetchCarts(){
        DispatchQueue.main.async {
            self.eventHandler?(.startLoading)
        }
        APIManager.shared.fetchAPI(
            modelType: CartsModel.self,
            type: .carts
        ){ result in
            self.eventHandler?(.stopLoading)
            switch result{
            case .failure(let err) :
                self.eventHandler?(.error(err))
                break
                
            case .success(let cartsData) :
                self.carts = cartsData.carts
                self.eventHandler?(.reloadData)
                break
            }
        }
    }
}
