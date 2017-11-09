//
//  Request+Errors.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func errors(paging: PagingParameters,
                completion: @escaping ([APIError], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "errors", with: [paging], excludeSiteParameter: true) { (results: [APIError]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func errors(id: Int,
                completion: @escaping (RequestError?) -> Void)
    {
        makeRequest(to: "errors/\(id)", excludeSiteParameter: true) { (results: [APIError]?, error: RequestError?, _) in
            completion(error)
        }
    }
}
