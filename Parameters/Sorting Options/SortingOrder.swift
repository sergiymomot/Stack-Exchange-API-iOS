//
//  SortingOrder.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 8/16/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

fileprivate let orderParameterName = "order"

public enum SortingOrder: String, ParametersConvertible {
    case ascending = "asc"
    case descending = "desc"
    
    public var parameters: [String : Any] {
        return [orderParameterName: self.rawValue]
    }
}
