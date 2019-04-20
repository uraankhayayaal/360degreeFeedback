//
//  RESTStructure.swift
//  360degreeFeedback
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 Ayaal Kaplin. All rights reserved.
//

import Foundation

struct Links: Codable {
    let linksSelf: Href
    let first, prev, next, last: Href?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case first, prev, next, last
    }
}

struct Href: Codable {
    let href: URL
}

struct Meta: Codable {
    let totalCount, pageCount, currentPage, perPage: Int
}
