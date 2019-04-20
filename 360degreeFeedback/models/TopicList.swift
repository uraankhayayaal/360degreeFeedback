//
//  TopicList.swift
//  360degreeFeedback
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 Ayaal Kaplin. All rights reserved.
//

import Foundation

struct TopicList: Codable {
    let items: [Topic]?
    let links: Links
    let meta: Meta
    
    enum CodingKeys: String, CodingKey {
        case items
        case links = "_links"
        case meta = "_meta"
    }
}

struct Topic: Codable {
    let id: Int
    let title: String
    let content: String?
    let photo: URL?
    let video: URL?
    let user_id: Int?
    let is_publish: Int // prefere to get Bool
    let status: Int
    let created_at: Int // prefere to get String
    let updated_at: Int
}

