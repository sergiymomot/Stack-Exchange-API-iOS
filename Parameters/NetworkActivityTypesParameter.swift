//
//  NetworkActivityTypesParameter.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public enum UsersNetworkActivityType: String {
    case posts
    case badges
    case comments
}

public struct NetworkActivityTypesParameter: ParametersConvertible {
    let types: [UsersNetworkActivityType]
    
    public var parameters: [String : Any] {
        return ["types": types.map({ $0.rawValue }).joined(separator: ";")]
    }
}
