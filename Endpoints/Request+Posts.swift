//
//  Request+Posts.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func posts(paging: PagingParameters? = nil,
               creationDate: CreationDateFilterParameters? = nil,
               sorting: SortingParameters<PostsSortOption>? = nil,
               completion: @escaping ([Post], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "posts", with: [paging, creationDate, sorting]) { (results: [Post]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func posts(ids: [Int],
               paging: PagingParameters? = nil,
               creationDate: CreationDateFilterParameters? = nil,
               sorting: SortingParameters<PostsSortOption>? = nil,
               completion: @escaping ([Post], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "posts/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))), with: [paging, creationDate, sorting]) { (results: [Post]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func postsComments(ids: [Int],
                       paging: PagingParameters? = nil,
                       creationDate: CreationDateFilterParameters? = nil,
                       sorting: SortingParameters<CommentsSortOption>? = nil,
                       completion: @escaping ([Comment], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "posts/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/comments", with: [paging, creationDate, sorting]) { (results: [Comment]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func postsCommentsAdd(id: Int, body: BodyParameter, completion: @escaping (Comment?, RequestError?) -> Void) {
        makeRequest(to: "posts/\(id)/comments/add", with: [body], isPostRequest: true) { (results: [Comment]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func postsCommentsRender(id: Int, body: BodyParameter, completion: @escaping (Comment?, RequestError?) -> Void) {
        makeRequest(to: "posts/\(id)/comments/render", with: [body], isPostRequest: true) { (results: [Comment]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func postsRevisions(ids: [Int],
                        paging: PagingParameters? = nil,
                        creationDate: CreationDateFilterParameters? = nil,
                        completion: @escaping ([Revision], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "posts/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/revisions", with: [paging, creationDate]) { (results: [Revision]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func postsSuggestedEdits(ids: [Int],
                             paging: PagingParameters? = nil,
                             creationDate: CreationDateFilterParameters? = nil,
                             sorting: SortingParameters<SuggestedEditsSortOption>? = nil,
                             completion: @escaping ([SuggestedEdit], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "posts/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/suggested-edits", with: [paging, creationDate, sorting]) { (results: [SuggestedEdit]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
