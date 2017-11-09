//
//  MigrationInfo.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 8/14/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct MigrationInfo: Codable {
    let onDate: Date?
    let otherSite: Site?
    let questionID: Int?
    
    private enum CodingKeys: String, CodingKey {
        case onDate = "on_date"
        case otherSite = "other_site"
        case questionID = "question_id"
    }
}
