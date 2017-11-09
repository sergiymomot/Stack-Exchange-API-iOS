//
//  FlagParameters.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

public struct FlagParameters: ParametersConvertible {
    let optionID: Int
    let comment: String
    
    public var parameters: [String : Any] {
        return ["option_id": optionID, "comment": comment]
    }
}
