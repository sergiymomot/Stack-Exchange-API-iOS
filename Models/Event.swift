//
//  Event.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 8/14/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public enum EventType: String, Codable {
    case questionPosted = "question_posted"
    case answerPosted = "answer_posted"
    case commentPosted = "comment_posted"
    case postEdited = "post_edited"
    case userCreated = "user_created"
}

public struct Event: Codable {
    let creationDate: Date?
    let id: Int?
    let type: EventType?
    let excerpt: String?
    let link: URL?
    
    private enum CodingKeys: String, CodingKey {
        case creationDate = "creation_date"
        case id = "event_id"
        case type = "event_type"
        case excerpt
        case link
    }
}
