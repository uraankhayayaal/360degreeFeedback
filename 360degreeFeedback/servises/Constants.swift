//
//  Constants.swift
//  360degreeFeedback
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 Ayaal Kaplin. All rights reserved.
//

import Foundation

struct K {
    struct ProductionServer {
        static let baseURL = "http://82.202.246.120:8080/"
    }
    
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
        static let page = "page"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
