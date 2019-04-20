//
//  APIConfiguration.swift
//  360degreeFeedback
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 Ayaal Kaplin. All rights reserved.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
