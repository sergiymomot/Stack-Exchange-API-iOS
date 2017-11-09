//
//  Request+Inbox.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func inbox(paging: PagingParameters? = nil,
               completion: @escaping ([InboxItem], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "inbox", with: [paging], excludeSiteParameter: true) { (results: [InboxItem]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func inboxUnread(paging: PagingParameters? = nil,
                     since: SinceParameter? = nil,
                     completion: @escaping ([InboxItem], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "inbox/unread", with: [paging, since], excludeSiteParameter: true) { (results: [InboxItem]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
