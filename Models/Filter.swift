//
//  Filter.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 8/14/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

public enum FilterType: String, Codable {
    case safe
    case unsafe
    case invalid
}

public struct Filter: Codable {
    let name: String?
    let type: FilterType?
    let includedFields: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case name = "filter"
        case type = "filter_type"
        case includedFields = "included_fields"
    }
}
