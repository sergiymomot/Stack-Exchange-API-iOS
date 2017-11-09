//
//  Request+AccessTokens.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func accessTokensInvalidate(accessTokens: [String],
                                paging: PagingParameters? = nil,
                                completion: @escaping ([AccessToken], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "access-tokens/" + vectorize(parameters: Array(accessTokens.prefix(20)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })) + "/invalidate", with: [paging], isPostRequest: true, excludeSiteParameter: true) { (results: [AccessToken]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func accessTokens(accessTokens: [String],
                      paging: PagingParameters? = nil,
                      completion: @escaping ([AccessToken], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "access-tokens/" + vectorize(parameters: Array(accessTokens.prefix(20)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })), with: [paging], excludeSiteParameter: true) { (results: [AccessToken]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func appsDeauthenticate(accessTokens: [String],
                            paging: PagingParameters? = nil,
                            completion: @escaping ([AccessToken], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "apps/" + vectorize(parameters: Array(accessTokens.prefix(20)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })) + "/de-authenticate", with: [paging], isPostRequest: true, excludeSiteParameter: true) { (results: [AccessToken]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
