//
//  EditParameters.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

public struct EditParameters: ParametersConvertible {
    let body: String
    let comment: String
    
    public var parameters: [String : Any] {
        return ["body": body, "comment": comment]
    }
}
