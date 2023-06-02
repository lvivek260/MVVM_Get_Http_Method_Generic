//
//  ViewController.swift
//  Generic_Get_API_MVVM
//
//  Created by Mac on 16/05/23.
//

import UIKit

class ProductViewController: UIViewController {
    let viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiConfiguration()
    }


}

extension ProductViewController{
    private func apiConfiguration(){
        fetchData()
        observeEvent()
    }
    private func fetchData(){
        viewModel.fetchProduct()
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
                print(self.viewModel.products.count)
                break
            case .error(let err) :
                print(err)
                break
            }
        }
    }
}
