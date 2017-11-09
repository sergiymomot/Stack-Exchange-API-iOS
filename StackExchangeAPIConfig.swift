//
//  StackExchangeAPIConfig.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

public struct StackExchangeAPIConfig {
    let key: String
    let site: String
    let filter: FilterName
    let header: [String: String]
    var accessToken: String?
    
    init(key: String, site: String, filter: FilterName = .defaultFilter, compression: CompressionType = .gzip, accessToken: String? = nil, extraHeaders: [String: String]? = nil) {
        self.key = key
        self.site = site
        self.filter = filter
        self.accessToken = accessToken
        self.header = ["Accept": "application/json", "Accept-Encoding": compression.rawValue].merging(extraHeaders ?? [:], uniquingKeysWith: { _, newValue in newValue })
    }
}
