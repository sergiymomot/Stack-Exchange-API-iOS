//
//  Request+Questions.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func questions(paging: PagingParameters? = nil,
                   creationDate: CreationDateFilterParameters? = nil,
                   sorting: SortingParameters<QuestionsAdvancedSortOption>? = nil,
                   completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questions(ids: [Int],
                   paging: PagingParameters? = nil,
                   creationDate: CreationDateFilterParameters? = nil,
                   sorting: SortingParameters<PostsSortOption>? = nil,
                   completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))), with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questionsAnswers(ids: [Int],
                         paging: PagingParameters? = nil,
                         creationDate: CreationDateFilterParameters? = nil,
                         sorting: SortingParameters<PostsSortOption>? = nil,
                         completion: @escaping ([Answer], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/answers", with: [paging, creationDate, sorting]) { (results: [Answer]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questionsAnswersAdd(id: Int, body: BodyParameter, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/answers/add", with: [body], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsAnswersRender(id: Int, body: BodyParameter, completion: @escaping (Answer?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/answers/render", with: [body], isPostRequest: true) { (results: [Answer]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsCloseOptions(id: Int, completion: @escaping ([FlagOption], RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/close/options") { (results: [FlagOption]?, error: RequestError?, _) in
            completion(results ?? [], error)
        }
    }
    
    func questionsComments(ids: [Int],
                           paging: PagingParameters? = nil,
                           creationDate: CreationDateFilterParameters? = nil,
                           sorting: SortingParameters<CommentsSortOption>? = nil,
                           completion: @escaping ([Comment], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/comments", with: [paging, creationDate, sorting]) { (results: [Comment]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questionsDelete(id: Int, completion: @escaping (RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/delete", with: [], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(error)
        }
    }
    
    func questionsDownvote(id: Int, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/downvote", with: [], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsDownvoteUndo(id: Int, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/downvote/undo", with: [], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsEdit(id: Int, edit: QuestionEditParameters, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/edit", with: [edit], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsFavorite(id: Int, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/favorite", with: [], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsFavoriteUndo(id: Int, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/favorite/undo", with: [], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsFlagsOptions(id: Int, completion: @escaping ([FlagOption], RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/flags/options") { (results: [FlagOption]?, error: RequestError?, _) in
            completion(results ?? [], error)
        }
    }
    
    func questionsFlagsAdd(id: Int, flag: QuestionsFlagParameters, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/flags/add", with: [flag], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsLinked(ids: [Int],
                         paging: PagingParameters? = nil,
                         creationDate: CreationDateFilterParameters? = nil,
                         sorting: SortingParameters<QuestionsRankedSortOption>? = nil,
                         completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/linked", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questionsRelated(ids: [Int],
                          paging: PagingParameters? = nil,
                          creationDate: CreationDateFilterParameters? = nil,
                          sorting: SortingParameters<QuestionsRankedSortOption>? = nil,
                          completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/related", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questionsTimeline(ids: [Int],
                           paging: PagingParameters? = nil,
                           creationDate: CreationDateFilterParameters? = nil,
                           completion: @escaping ([QuestionTimeline], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/timeline", with: [paging, creationDate]) { (results: [QuestionTimeline]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questionsUpvote(id: Int, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/upvote", with: [], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsUpvoteUndo(id: Int, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/\(id)/upvote/undo", with: [], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsAdd(question: NewQuestionParameters, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/add", with: [question], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsRender(question: NewQuestionParameters, completion: @escaping (Question?, RequestError?) -> Void) {
        makeRequest(to: "questions/render", with: [question], isPostRequest: true) { (results: [Question]?, error: RequestError?, _) in
            completion(results?.first, error)
        }
    }
    
    func questionsFeatured(paging: PagingParameters? = nil,
                           creationDate: CreationDateFilterParameters? = nil,
                           sorting: SortingParameters<PostsSortOption>? = nil,
                           tagged: TaggedParameter,
                           completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/featured", with: [paging, creationDate, sorting, tagged]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questionsNoAnswers(paging: PagingParameters? = nil,
                            creationDate: CreationDateFilterParameters? = nil,
                            sorting: SortingParameters<PostsSortOption>? = nil,
                            tagged: TaggedParameter,
                            completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/no-answers", with: [paging, creationDate, sorting, tagged]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questionsUnanswered(paging: PagingParameters? = nil,
                             creationDate: CreationDateFilterParameters? = nil,
                             sorting: SortingParameters<PostsSortOption>? = nil,
                             tagged: TaggedParameter,
                             completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/unanswered", with: [paging, creationDate, sorting, tagged]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func questionsUnansweredMyTags(paging: PagingParameters? = nil,
                                   creationDate: CreationDateFilterParameters? = nil,
                                   sorting: SortingParameters<PostsSortOption>? = nil,
                                   completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "questions/unanswered/my-tags", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
