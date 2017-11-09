//
//  FilterName.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

public enum FilterName {
    case defaultFilter
    case withBody
    case none
    case total
    case custom(name: String)
    
    var nameString: String {
        switch self {
        case .defaultFilter:
            return "default"
        case .withBody:
            return "withbody"
        case .none:
            return "none"
        case .total:
            return "total"
        case .custom(let name):
            return name
        }
    }
}
