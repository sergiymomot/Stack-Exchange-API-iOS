//
//  QuestionsFlagParameters.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct QuestionsFlagParameters: ParametersConvertible {
    let optionID: Int
    let comment: String
    let targetSite: String
    let questionID: Int
    
    public var parameters: [String : Any] {
        return ["option_id": optionID, "comment": comment, "target_site": targetSite, "question_id": questionID]
    }
}
