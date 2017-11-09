//
//  CreationDateFilterParameters.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 8/16/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public struct CreationDateFilterParameters: ParametersConvertible {
    private let fromDateParameterName = "fromdate"
    private let toDateParameterName = "todate"
    
    let fromDate: Date?
    let toDate: Date?
    
    init(fromDate: Date? = nil, toDate: Date? = nil) {
        self.fromDate = fromDate
        self.toDate = toDate
    }
    
    init(fromDate: Int? = nil, toDate: Int? = nil) {
        self.fromDate = fromDate != nil ? Date(timeIntervalSince1970: Double(fromDate!)) : nil
        self.toDate = toDate != nil ? Date(timeIntervalSince1970: Double(toDate!)) : nil
    }
    
    public var parameters: [String: Any] {
        var params: [String: Any] = [:]
        
        if let date = self.fromDate {
            params[fromDateParameterName] = Int(date.timeIntervalSince1970)
        }
        
        if let date = self.toDate {
            params[toDateParameterName] = Int(date.timeIntervalSince1970)
        }
        
        return params
    }
}
