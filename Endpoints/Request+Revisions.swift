//
//  Request+Revisions.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func revisions(ids: [String],
                   paging: PagingParameters? = nil,
                   creationDate: CreationDateFilterParameters? = nil,
                   completion: @escaping ([Revision], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "revisions/" + vectorize(parameters: Array(ids.prefix(20))), with: [paging, creationDate]) { (results: [Revision]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
