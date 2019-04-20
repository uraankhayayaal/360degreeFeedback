//
//  APIRouter.swift
//  360degreeFeedback
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 Ayaal Kaplin. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case login(email:String, password:String)
    case topics(page: Int)
    case events(page: Int)
    case post(id: Int)
    case event(id: Int)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .topics, .post, .events, .event:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return "/login"
        case .topics:
            return "/articles"
        case .post(let id):
            return "/article/\(id)"
        case .events:
            return "/events"
        case .event(let id):
            return "/event/\(id)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [K.APIParameterKey.email: email, K.APIParameterKey.password: password]
        case .topics, .events:
            return nil
        case .post, .event:
            return nil
        }
    }
    
    // MARK: - Parameters
    private var queryItems: [URLQueryItem]? {
        switch self {
        case .login:
            return nil
        case .topics(let page):
            return [URLQueryItem(name: "page", value: String(page))]
        case .post:
            return nil
        case .events(let page):
            return [URLQueryItem(name: "page", value: String(page))]
        case .event:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        let urlComponents = NSURLComponents(string: url.absoluteString)!
        
        urlComponents.path = "/api" + path
        
        urlComponents.queryItems = queryItems
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
