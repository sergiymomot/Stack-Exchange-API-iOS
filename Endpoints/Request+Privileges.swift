//
//  Request+Privileges.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func privileges(paging: PagingParameters, completion: @escaping ([Privilege], RequestError?, Bool) -> Void) {
        makeRequest(to: "privileges", with: [paging]) { (results: [Privilege]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
