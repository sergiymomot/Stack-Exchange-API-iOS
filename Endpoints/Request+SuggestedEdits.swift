//
//  Request+SuggestedEdits.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func suggestedEdits(paging: PagingParameters? = nil,
                        creationDate: CreationDateFilterParameters? = nil,
                        sorting: SortingParameters<SuggestedEditsSortOption>? = nil,
                        completion: @escaping ([SuggestedEdit], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "suggested-edits", with: [paging, creationDate, sorting]) { (results: [SuggestedEdit]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func suggestedEdits(ids: [Int],
                        paging: PagingParameters? = nil,
                        creationDate: CreationDateFilterParameters? = nil,
                        sorting: SortingParameters<SuggestedEditsSortOption>? = nil,
                        completion: @escaping ([SuggestedEdit], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "suggested-edits/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))), with: [paging, creationDate, sorting]) { (results: [SuggestedEdit]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
