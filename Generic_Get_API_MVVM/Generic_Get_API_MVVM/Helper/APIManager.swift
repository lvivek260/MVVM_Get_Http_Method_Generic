//
//  APIManager.swift
//  MVVM_Vivek_Project
//
//  Created by Mac on 12/05/23.
//
import Foundation

enum FetchingError: Error{
    case invalidURl
    case invalidData
    case invalidResponse
    case decodingError(Error)
}
enum Event{
    case startLoading
    case stopLoading
    case reloadData
    case error(FetchingError)
}

typealias Handler<T> = (Result<T,FetchingError>)->Void

final class APIManager{
    static let shared = APIManager()
    private init(){}
    
    func fetchAPI<T: Decodable>(
        modelType: T.Type,
        type: EndPointItems,
        completion: @escaping Handler<T>){
            
        guard let productURl = type.url else{
            completion(.failure(.invalidURl))
            return
        }
        URLSession.shared.dataTask(with: productURl){ data,response,error in
            guard let data = data , error == nil else{
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let fetchedData = try JSONDecoder().decode(modelType, from: data)
                completion(.success(fetchedData))
            }
            catch let err{
                completion(.failure(.decodingError(err)))
            }
            
        }.resume()
    }
}
