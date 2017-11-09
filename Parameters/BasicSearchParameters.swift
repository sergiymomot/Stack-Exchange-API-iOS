//
//  BasicSearchParameters.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct BasicSearchParameters: ParametersConvertible {
    let tagged: [String]?
    let notTagged: [String]?
    let inTitle: String?
    
    public var parameters: [String : Any] {
        var parameters: [String: Any] = [:]
        
        if let tagged = tagged?.prefix(100).joined(separator: ":") {
            parameters["tagged"] = tagged
        }
        
        if let nottagged = notTagged?.prefix(100).joined(separator: ";") {
            parameters["nottagged"] = nottagged
        }
        
        if let intitle = inTitle {
            parameters["intitle"] = intitle
        }
        
        return parameters
    }
}
