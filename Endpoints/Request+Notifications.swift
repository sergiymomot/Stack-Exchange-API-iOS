//
//  Request+Notifications.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func notifications(paging: PagingParameters? = nil,
               completion: @escaping ([Notification], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "notifications", with: [paging], excludeSiteParameter: true) { (results: [Notification]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func notificationsUnread(paging: PagingParameters? = nil,
                             completion: @escaping ([Notification], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "notifications/unread", with: [paging], excludeSiteParameter: true) { (results: [Notification]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
