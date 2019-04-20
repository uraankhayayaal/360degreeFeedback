//
//  Rest.swift
//  360degreeFeedback
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 Ayaal Kaplin. All rights reserved.
//

import Foundation
import Alamofire
import PromisedFuture

public class Rest{
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder()) -> Future<T> {
        return Future(operation: { completion in
            AF.request(route).responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        })
    }
    
//    static func login(email: String, password: String, completion:@escaping (Alamofire.Result<User>)->Void) {
//        AF.request(APIRouter.login(email: email, password: password))
//            .responseDecodable { (response: DataResponse<User>) in
//                completion(response.result)
//        }
//    }
    
    //    static func userArticles(userID: Int) -> Future<[Article]> {
    //        let jsonDecoder = JSONDecoder()
    //        jsonDecoder.dateDecodingStrategy = .formatted(.init())
    //        return performRequest(route: APIRouter.articles(userId: userID), decoder: jsonDecoder)
    //    }
    //
    //    static func getArticle(articleID: Int) -> Future<Article> {
    //        let jsonDecoder = JSONDecoder()
    //        jsonDecoder.dateDecodingStrategy = .formatted(.init())
    //        return performRequest(route: APIRouter.article(id: articleID), decoder: jsonDecoder)
    //    }
    
    static func topics(page: Int = 1, completion:@escaping (Alamofire.Result<TopicList>)->Void){
        AF.request(APIRouter.posts(page: page))
            .responseDecodable { (response: DataResponse<TopicList>) in
                completion(response.result)
        }
    }
    
//    static func events(page: Int = 1, completion:@escaping (Alamofire.Result<EventProvider>)->Void){
//        AF.request(APIRouter.events(page: page))
//            .responseDecodable { (response: DataResponse<EventProvider>) in
//                completion(response.result)
//        }
//    }
}
