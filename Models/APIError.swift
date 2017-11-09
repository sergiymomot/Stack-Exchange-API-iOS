//
//  APIError.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

public struct APIError: Codable {
    let id: Int
    let name: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "error_id"
        case name = "error_name"
        case description
    }
}
