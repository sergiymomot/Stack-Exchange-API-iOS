//
//  SimilarQuestionsParameters.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct SimilarQuestionsParameters: ParametersConvertible {
    let title: String
    let tagged: [String]?
    let notTagged: [String]?
    
    public var parameters: [String : Any] {
        var params: [String: Any] = ["title": title]
        
        if let tagged = self.tagged {
            params["tagged"] = tagged.joined(separator: ";")
        }
        
        if let notTagged = self.notTagged {
            params["nottagged"] = notTagged.joined(separator: ";")
        }
        
        return params
    }
}
