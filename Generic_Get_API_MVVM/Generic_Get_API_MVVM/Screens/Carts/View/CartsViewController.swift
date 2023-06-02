//
//  CartsViewController.swift
//  Generic_Get_API_MVVM
//
//  Created by Mac on 16/05/23.
//

import UIKit

class CartsViewController: UIViewController {
    let viewModel = CartsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiConfiguration()
    }
    
}
  
extension CartsViewController{
    private func apiConfiguration(){
        fetchData()
        observeEvent()
    }
    private func fetchData(){
        viewModel.fetchCarts()
    }
    private func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            guard let self = self else{return}
            
            switch event {
            case .startLoading :
                break
            case .stopLoading :
                break
            case .reloadData :
                print(self.viewModel.carts.count)
                break
            case .error(let err) :
                print(err)
                break
            }
        }
    }
}



