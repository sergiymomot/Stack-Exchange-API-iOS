//
//  BodyParameter.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct BodyParameter: ParametersConvertible {
    let body: String
    
    public var parameters: [String: Any] {
        return ["body": body]
    }
}
