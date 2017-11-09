//
//  Request+Sites.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func sites(paging: PagingParameters, completion: @escaping ([Site], RequestError?, Bool) -> Void) {
        makeRequest(to: "sites", with: [paging], excludeSiteParameter: true) { (results: [Site]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
