//
//  SiteTypesParameter.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct SiteTypesParameter: ParametersConvertible {
    let types: [SiteType]
    
    public var parameters: [String : Any] {
        return ["types": types.map({ $0.rawValue }).joined(separator: ";")]
    }
}
