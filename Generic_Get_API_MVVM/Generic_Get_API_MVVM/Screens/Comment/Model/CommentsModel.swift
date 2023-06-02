//
//  UserModel.swift
//  MVVM_Get_Method_Generic
//
//  Created by Mac on 15/05/23.
//

import Foundation

struct CommentsModel: Decodable{
    let comments: [Comments]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Comments: Decodable{
    let id: Int
    let body: String
    let postId: Int
    let user: User
}

struct User: Decodable{
    let id: Int
    let username: String
}
