//
//  SinceParameter.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct SinceParameter: ParametersConvertible {
    let since: Date
    
    public var parameters: [String : Any] {
        return ["since": since.timeIntervalSince1970]
    }
}
