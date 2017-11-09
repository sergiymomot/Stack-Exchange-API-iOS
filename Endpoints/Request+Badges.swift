//
//  Reques+Badges.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/4/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func badges(paging: PagingParameters? = nil,
                 creationDate: CreationDateFilterParameters? = nil,
                 sorting: SortingParameters<BadgesSortOption>? = nil,
                 inname: InnameSearchParameter? = nil,
                 completion: @escaping ([Badge], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "badges", with: [paging, creationDate, sorting, inname]) { (results: [Badge]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func badges(ids: [Int],
                paging: PagingParameters? = nil,
                creationDate: CreationDateFilterParameters? = nil,
                sorting: SortingParameters<BadgesSortOption>? = nil,
                completion: @escaping ([Badge], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "badges/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))), with: [paging, creationDate, sorting]) { (results: [Badge]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func badgesName(paging: PagingParameters? = nil,
                    creationDate: CreationDateFilterParameters? = nil,
                    sorting: SortingParameters<BadgesSortOption>? = nil,
                    inname: InnameSearchParameter? = nil,
                    completion: @escaping ([Badge], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "badges/name", with: [paging, creationDate, sorting, inname]) { (results: [Badge]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func badgesTags(paging: PagingParameters? = nil,
                    creationDate: CreationDateFilterParameters? = nil,
                    sorting: SortingParameters<BadgesSortOption>? = nil,
                    inname: InnameSearchParameter? = nil,
                    completion: @escaping ([Badge], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "badges/tags", with: [paging, creationDate, sorting, inname]) { (results: [Badge]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func badgesRecipients(paging: PagingParameters? = nil,
                          creationDate: CreationDateFilterParameters? = nil,
                          completion: @escaping ([Badge], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "badges/recipients", with: [paging, creationDate]) { (results: [Badge]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func badgesRecipients(ids: [Int],
                          paging: PagingParameters? = nil,
                          creationDate: CreationDateFilterParameters? = nil,
                          completion: @escaping ([Badge], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "badges/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/recipients", with: [paging, creationDate]) { (results: [Badge]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
