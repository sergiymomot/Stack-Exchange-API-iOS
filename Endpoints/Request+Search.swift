//
//  Request+Search.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func search(paging: PagingParameters? = nil,
                creationDate: CreationDateFilterParameters? = nil,
                sortingOption: SortingParameters<RelevantQuestionsSortOption>? = nil,
                searchParameters: BasicSearchParameters,
                completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "search", with: [paging, creationDate, sortingOption, searchParameters]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func similar(paging: PagingParameters? = nil,
                 creationDate: CreationDateFilterParameters? = nil,
                 sortingOption: SortingParameters<RelevantQuestionsSortOption>? = nil,
                 searchParameters: SimilarQuestionsParameters,
                 completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "similar", with: [paging, creationDate, sortingOption, searchParameters]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func searchAdvanced(paging: PagingParameters? = nil,
                        creationDate: CreationDateFilterParameters? = nil,
                        sortingOption: SortingParameters<RelevantQuestionsSortOption>? = nil,
                        searchParameters: SearchParameters,
                        completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "search/advanced", with: [paging, creationDate, sortingOption, searchParameters]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func searchExcerpts(paging: PagingParameters? = nil,
                        creationDate: CreationDateFilterParameters? = nil,
                        sortingOption: SortingParameters<RelevantQuestionsSortOption>? = nil,
                        searchParameters: SearchParameters,
                        completion: @escaping ([SearchExcerpt], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "search/excerpts", with: [paging, creationDate, sortingOption, searchParameters]) { (results: [SearchExcerpt]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
