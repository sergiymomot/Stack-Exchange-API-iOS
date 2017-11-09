//
//  Request+Answers.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func answers(paging: PagingParameters? = nil,
                 creationDate: CreationDateFilterParameters? = nil,
                 sorting: SortingParameters<PostsSortOption>? = nil,
                 completion: @escaping ([Answer], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "answers", with: [paging, creationDate, sorting]) { (results: [Answer]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func answers(ids: [Int],
                 paging: PagingParameters? = nil,
                 creationDate: CreationDateFilterParameters? = nil,
                 sorting: SortingParameters<PostsSortOption>? = nil,
                 completion: @escaping ([Answer], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "answers/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))), with: [paging, creationDate, sorting]) { (results: [Answer]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func answersAccept(id: Int, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/accept", with: [], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func answersAcceptUndo(id: Int, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/accept/undo", with: [], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func answersComments(ids: [Int],
                         paging: PagingParameters? = nil,
                         creationDate: CreationDateFilterParameters? = nil,
                         sorting: SortingParameters<CommentsSortOption>? = nil,
                         completion: @escaping ([Comment], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "answers/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/comments", with: [paging, creationDate, sorting]) { (results: [Comment]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func answersDelete(id: Int, completion: @escaping (RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/delete", with: [], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(error)
        }
    }
    
    func answersDownvote(id: Int, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/downvote", with: [], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func answersDownvoteUndo(id: Int, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/downvote/undo", with: [], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }

    func answersEdit(id: Int, edit: EditParameters, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/edit", with: [edit], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func answersFlagsOptions(id: Int, completion: @escaping ([FlagOption], RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/flags/options") { (results: [FlagOption]?, error: RequestError?, _) in
            completion(results ?? [], error)
        }
    }
    
    func answersFlagsAdd(id: Int, flag: FlagParameters, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/flags/add", with: [flag], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func answersQuestions(ids: [Int],
                         paging: PagingParameters? = nil,
                         creationDate: CreationDateFilterParameters? = nil,
                         sorting: SortingParameters<PostsSortOption>? = nil,
                         completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "answers/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/questions", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func answersUpvote(id: Int, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/upvote", with: [], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func answersUpvoteUndo(id: Int, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "answers/\(id)/upvote/undo", with: [], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
}
