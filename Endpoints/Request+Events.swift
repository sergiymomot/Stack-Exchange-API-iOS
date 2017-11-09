//
//  Request+Events.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func events(paging: PagingParameters? = nil, since: SinceParameter? = nil, completion: @escaping ([Event], RequestError?, Bool) -> Void) {
        makeRequest(to: "events", with: [paging, since]) { (results: [Event]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
