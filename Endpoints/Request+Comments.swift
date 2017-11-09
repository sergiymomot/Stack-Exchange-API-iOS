//
//  Request+Comments.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func comments(paging: PagingParameters? = nil,
                  creationDate: CreationDateFilterParameters? = nil,
                  sorting: SortingParameters<CommentsSortOption>? = nil,
                  completion: @escaping ([Comment], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "comments", with: [paging, creationDate, sorting]) { (results: [Comment]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func comments(ids: [Int],
                 paging: PagingParameters? = nil,
                 creationDate: CreationDateFilterParameters? = nil,
                 sorting: SortingParameters<CommentsSortOption>? = nil,
                 completion: @escaping ([Comment], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "comments/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))), with: [paging, creationDate, sorting]) { (results: [Comment]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func commentsDelete(id: Int, completion: @escaping (RequestError?) -> Void) {
        makeRequest(to: "comments/\(id)/delete", with: [], isPostRequest: true) { (results: [Comment]?, error: RequestError?, _) in
            completion(error)
        }
    }
    
    //no edit comment
    func commentsEdit(id: Int, edit: EditParameters, completion: @escaping (Comment?, RequestError?) -> Void) {
        makeRequest(to: "comments/\(id)/edit", with: [edit], isPostRequest: true) { (results: [Comment]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func commentsFlagsOptions(id: Int, completion: @escaping ([FlagOption], RequestError?) -> Void) {
        makeRequest(to: "comments/\(id)/flags/options") { (results: [FlagOption]?, error: RequestError?, _) in
            completion(results ?? [], error)
        }
    }
    
    func commentsFlagsAdd(id: Int, flag: FlagParameters, completion: @escaping (Comment?, RequestError?) -> Void) {
        makeRequest(to: "comments/\(id)/flags/add", with: [flag], isPostRequest: true) { (results: [Comment]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func commentsUpvote(id: Int, completion: @escaping (Comment?, RequestError?) -> Void) {
        makeRequest(to: "comments/\(id)/upvote", with: [], isPostRequest: true) { (results: [Comment]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func commentsUpvoteUndo(id: Int, completion: @escaping (Comment?, RequestError?) -> Void) {
        makeRequest(to: "comments/\(id)/upvote/undo", with: [], isPostRequest: true) { (results: [Comment]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
}
