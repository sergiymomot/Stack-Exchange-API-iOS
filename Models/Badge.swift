//
//  Badge.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 8/14/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public enum BadgeType: String, Codable {
    case named
    case tagBased = "tag_based"
}

public enum BadgeRank: String, Codable {
    case gold
    case silver
    case bronze
}

public struct Badge: Codable {
    let awardCount: Int?
    let id: Int?
    let type: BadgeType?
    let description: String?
    let link: URL?
    let name: String?
    let rank: BadgeRank?
    let user: ShallowUser?
    
    private enum CodingKeys: String, CodingKey {
        case awardCount = "award_count"
        case id = "badge_id"
        case type = "badge_type"
        case description
        case link
        case name
        case rank
        case user
    }
}
