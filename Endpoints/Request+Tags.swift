//
//  Request+Tags.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func tags(paging: PagingParameters? = nil,
             creationDate: CreationDateFilterParameters? = nil,
             sorting: SortingParameters<TagsSortOption>? = nil,
             inname: InnameSearchParameter? = nil,
             completion: @escaping ([Tag], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags", with: [paging, creationDate, sorting, inname]) { (results: [Tag]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func tagsInfo(tags: [String],
                  paging: PagingParameters? = nil,
                  creationDate: CreationDateFilterParameters? = nil,
                  sorting: SortingParameters<TagsSortOption>? = nil,
                  completion: @escaping ([Tag], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/" + vectorize(parameters: Array(tags.prefix(maxParameterElements)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })) + "/info", with: [paging, creationDate, sorting]) { (results: [Tag]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func tagsModeratorOnly(paging: PagingParameters? = nil,
                           creationDate: CreationDateFilterParameters? = nil,
                           sorting: SortingParameters<TagsSortOption>? = nil,
                           inname: InnameSearchParameter? = nil,
                           completion: @escaping ([Tag], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/moderator-only", with: [paging, creationDate, sorting, inname]) { (results: [Tag]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func tagsRequired(paging: PagingParameters? = nil,
                      creationDate: CreationDateFilterParameters? = nil,
                      sorting: SortingParameters<TagsSortOption>? = nil,
                      inname: InnameSearchParameter? = nil,
                      completion: @escaping ([Tag], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/required", with: [paging, creationDate, sorting, inname]) { (results: [Tag]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func tagsSynonyms(paging: PagingParameters? = nil,
                      creationDate: CreationDateFilterParameters? = nil,
                      sorting: SortingParameters<TagSynonymsSortOption>? = nil,
                      completion: @escaping ([TagSynonym], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/synonyms", with: [paging, creationDate, sorting]) { (results: [TagSynonym]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }

    func tagsFAQ(tags: [String],
                 paging: PagingParameters? = nil,
                 completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/" + vectorize(parameters: Array(tags.prefix(5)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })) + "/faq", with: [paging]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }

    func tagsRelated(tags: [String],
                     paging: PagingParameters? = nil,
                     completion: @escaping ([Tag], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/" + vectorize(parameters: Array(tags.prefix(4)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })) + "/related", with: [paging]) { (results: [Tag]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }

    func tagsSynonyms(tags: [String],
                      paging: PagingParameters? = nil,
                      creationDate: CreationDateFilterParameters? = nil,
                      sorting: SortingParameters<TagSynonymsSortOption>? = nil,
                      completion: @escaping ([TagSynonym], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/" + vectorize(parameters: Array(tags.prefix(20)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })) + "/synonyms", with: [paging, creationDate, sorting]) { (results: [TagSynonym]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func tagsWikis(tags: [String],
                   paging: PagingParameters? = nil,
                   completion: @escaping ([TagWiki], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/" + vectorize(parameters: Array(tags.prefix(20)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })) + "/wikis", with: [paging]) { (results: [TagWiki]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func tagsTopAnswerers(tag: String,
                          period: TopUsersPeriod,
                          paging: PagingParameters? = nil,
                          completion: @escaping ([TagScore], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/" + tag.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! + "/top-answerers/" + period.rawValue, with: [paging]) { (results: [TagScore]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func tagsTopAskers(tag: String,
                       period: TopUsersPeriod,
                       paging: PagingParameters? = nil,
                       completion: @escaping ([TagScore], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "tags/" + tag.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! + "/top-askers/" + period.rawValue, with: [paging]) { (results: [TagScore]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
