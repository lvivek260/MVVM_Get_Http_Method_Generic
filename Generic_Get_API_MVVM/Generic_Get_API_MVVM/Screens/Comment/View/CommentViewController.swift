//
//  CommentViewController.swift
//  Generic_Get_API_MVVM
//
//  Created by Mac on 16/05/23.
//

import UIKit

class CommentViewController: UIViewController {
    let viewModel = CommentViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiConfiguration()
    }
    
}

extension CommentViewController{
    private func apiConfiguration(){
        fetchData()
        observeEvent()
    }
    private func fetchData(){
        viewModel.fetchComment()
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
                print(self.viewModel.comments.count)
                break
            case .error(let err) :
                print(err)
                break
            }
        }
    }
}



