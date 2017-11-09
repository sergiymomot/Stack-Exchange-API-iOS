//
//  UserTimeline.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 8/15/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public enum UserTimelineType: String, Codable {
    case commented
    case asked
    case answered
    case badge
    case revision
    case accepted
    case reviewed
    case suggested
}

public struct UserTimeline: Codable {
    let badgeID: Int?
    let commentID: Int?
    let creationDate: Date?
    let detailText: String?
    let link: URL?
    let postID: Int?
    let postType: PostType?
    let suggestedEditID: Int?
    let type: UserTimelineType?
    let title: String?
    let userID: Int?
    
    private enum CodingKeys: String, CodingKey {
        case badgeID = "badge_id"
        case commentID = "comment_id"
        case creationDate = "creation_date"
        case detailText = "detail"
        case link
        case postID = "post_id"
        case postType = "post_type"
        case suggestedEditID = "suggested_edit_id"
        case type = "timeline_type"
        case title
        case userID = "user_id"
    }
}
