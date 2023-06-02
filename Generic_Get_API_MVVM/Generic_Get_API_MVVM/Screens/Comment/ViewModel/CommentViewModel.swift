//
//  CommentViewModel.swift
//  Generic_Get_API_MVVM
//
//  Created by Mac on 16/05/23.
//

import Foundation
final class CommentViewModel{
    var comments: [Comments] = []
    var eventHandler: ((_ event: Event)->())?
    
    func fetchComment(){
        DispatchQueue.main.async {
            self.eventHandler?(.startLoading)
        }
        APIManager.shared.fetchAPI(
            modelType: CommentsModel.self,
            type: .comments
        ){ result in
            self.eventHandler?(.stopLoading)
            switch result{
            case .failure(let err) :
                self.eventHandler?(.error(err))
                break
                
            case .success(let commentsData) :
                self.comments = commentsData.comments
                self.eventHandler?(.reloadData)
                break
            }
        }
    }
}
