//
//  Request+Info.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func info(completion: @escaping (Info?, RequestError?) -> Void) {
        makeRequest(to: "info") { (results: [Info]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
}
