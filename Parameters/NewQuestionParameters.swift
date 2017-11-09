//
//  NewQuestionParameters.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct NewQuestionParameters: ParametersConvertible {
    let title: String
    let body: String
    let tags: [String]
    
    public var parameters: [String : Any] {
        return ["title": title, "body": body, "tags": tags.prefix(5).joined(separator: ";")]
    }
}
