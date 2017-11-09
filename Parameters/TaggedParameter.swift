//
//  TaggedParameter.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct TaggedParameter: ParametersConvertible {
    let tagged: [String]
    
    public var parameters: [String : Any] {
        return ["tagged": tagged.prefix(5).joined(separator: ";")]
    }
}
