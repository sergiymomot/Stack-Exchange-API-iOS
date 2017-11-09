//
//  Request+Users.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/5/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

extension StackExchangeAPI {
    func users(paging: PagingParameters? = nil,
               creationDate: CreationDateFilterParameters? = nil,
               sorting: SortingParameters<UsersSortOption>? = nil,
               inname: InnameSearchParameter? = nil,
               completion: @escaping ([User], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users", with: [paging, creationDate, sorting, inname]) { (results: [User]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func users(ids: [Int],
               paging: PagingParameters? = nil,
               creationDate: CreationDateFilterParameters? = nil,
               sorting: SortingParameters<UsersSortOption>? = nil,
               completion: @escaping ([User], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))), with: [paging, creationDate, sorting]) { (results: [User]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersAnswers(ids: [Int],
                      paging: PagingParameters? = nil,
                      creationDate: CreationDateFilterParameters? = nil,
                      sorting: SortingParameters<PostsSortOption>? = nil,
                      completion: @escaping ([Answer], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/answers", with: [paging, creationDate, sorting]) { (results: [Answer]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersBadges(ids: [Int],
                     paging: PagingParameters? = nil,
                     creationDate: CreationDateFilterParameters? = nil,
                     sorting: SortingParameters<BadgesSortOption>? = nil,
                     completion: @escaping ([Badge], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/badges", with: [paging, creationDate, sorting]) { (results: [Badge]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersComments(ids: [Int],
                       paging: PagingParameters? = nil,
                       creationDate: CreationDateFilterParameters? = nil,
                       sorting: SortingParameters<CommentsSortOption>? = nil,
                       completion: @escaping ([Comment], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/comments", with: [paging, creationDate, sorting]) { (results: [Comment]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersComments(ids: [Int],
                       toid: Int,
                       paging: PagingParameters? = nil,
                       creationDate: CreationDateFilterParameters? = nil,
                       sorting: SortingParameters<CommentsSortOption>? = nil,
                       completion: @escaping ([Comment], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/answers/\(toid)", with: [paging, creationDate, sorting]) { (results: [Comment]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersFavorites(ids: [Int],
                        paging: PagingParameters? = nil,
                        creationDate: CreationDateFilterParameters? = nil,
                        sorting: SortingParameters<AddedQuestionsSortOption>? = nil,
                        completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/favorites", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersMentioned(ids: [Int],
                        paging: PagingParameters? = nil,
                        creationDate: CreationDateFilterParameters? = nil,
                        sorting: SortingParameters<CommentsSortOption>? = nil,
                        completion: @escaping ([Comment], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/mentioned", with: [paging, creationDate, sorting]) { (results: [Comment]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersNetworkActivity(id: Int,
                              types: NetworkActivityTypesParameter? = nil,
                              paging: PagingParameters? = nil,
                              creationDate: CreationDateFilterParameters? = nil,
                              completion: @escaping ([NetworkActivity], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/network-activity", with: [paging, creationDate, types]) { (results: [NetworkActivity]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersNotifications(id: Int,
                            paging: PagingParameters? = nil,
                            completion: @escaping ([Notification], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/notifications", with: [paging]) { (results: [Notification]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersNotificationsUnread(id: Int,
                                  paging: PagingParameters? = nil,
                                  completion: @escaping ([Notification], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/notifications/unread", with: [paging]) { (results: [Notification]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersPosts(ids: [Int],
                    paging: PagingParameters? = nil,
                    creationDate: CreationDateFilterParameters? = nil,
                    sorting: SortingParameters<PostsSortOption>? = nil,
                    completion: @escaping ([Post], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/posts", with: [paging, creationDate, sorting]) { (results: [Post]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersPrivileges(id: Int,
                         paging: PagingParameters? = nil,
                         completion: @escaping ([Privilege], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/privileges", with: [paging]) { (results: [Privilege]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersQuestions(ids: [Int],
                        paging: PagingParameters? = nil,
                        creationDate: CreationDateFilterParameters? = nil,
                        sorting: SortingParameters<PostsSortOption>? = nil,
                        completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/questions", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersQuestionsFeatured(ids: [Int],
                                paging: PagingParameters? = nil,
                                creationDate: CreationDateFilterParameters? = nil,
                                sorting: SortingParameters<PostsSortOption>? = nil,
                                completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/questions/featured", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersQuestionsNoAnswers(ids: [Int],
                                 paging: PagingParameters? = nil,
                                 creationDate: CreationDateFilterParameters? = nil,
                                 sorting: SortingParameters<PostsSortOption>? = nil,
                                 completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/questions/no-answers", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersQuestionsUnaccepted(ids: [Int],
                                  paging: PagingParameters? = nil,
                                  creationDate: CreationDateFilterParameters? = nil,
                                  sorting: SortingParameters<PostsSortOption>? = nil,
                                  completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/questions/unaccepted", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersQuestionsUnanswered(ids: [Int],
                                  paging: PagingParameters? = nil,
                                  creationDate: CreationDateFilterParameters? = nil,
                                  sorting: SortingParameters<PostsSortOption>? = nil,
                                  completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/questions/unanswered", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersReputation(ids: [Int],
                         paging: PagingParameters? = nil,
                         creationDate: CreationDateFilterParameters? = nil,
                         completion: @escaping ([Reputation], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/reputation", with: [paging, creationDate]) { (results: [Reputation]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersReputationHistory(ids: [Int],
                                paging: PagingParameters? = nil,
                                completion: @escaping ([ReputationHistory], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/reputation-history", with: [paging]) { (results: [ReputationHistory]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersReputationHistoryFull(id: Int,
                                    paging: PagingParameters? = nil,
                                    completion: @escaping ([ReputationHistory], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/reputation-history/full", with: [paging]) { (results: [ReputationHistory]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersSuggestedEdits(ids: [Int],
                             paging: PagingParameters? = nil,
                             creationDate: CreationDateFilterParameters? = nil,
                             sorting: SortingParameters<SuggestedEditsSortOption>? = nil,
                             completion: @escaping ([SuggestedEdit], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/suggested-edits", with: [paging, creationDate, sorting]) { (results: [SuggestedEdit]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersTags(ids: [Int],
                   paging: PagingParameters? = nil,
                   creationDate: CreationDateFilterParameters? = nil,
                   sorting: SortingParameters<TagsSortOption>? = nil,
                   completion: @escaping ([Tag], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/tags", with: [paging, creationDate, sorting]) { (results: [Tag]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersTagsTopAnswers(id: Int,
                             tags: [String],
                             paging: PagingParameters? = nil,
                             creationDate: CreationDateFilterParameters? = nil,
                             sorting: SortingParameters<PostsSortOption>? = nil,
                             completion: @escaping ([Answer], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/tags/" + vectorize(parameters: Array(tags.prefix(5)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })) + "/top-answers", with: [paging, creationDate, sorting]) { (results: [Answer]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersTagsTopQuestions(id: Int,
                               tags: [String],
                               paging: PagingParameters? = nil,
                               creationDate: CreationDateFilterParameters? = nil,
                               sorting: SortingParameters<PostsSortOption>? = nil,
                               completion: @escaping ([Question], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/tags/" + vectorize(parameters: Array(tags.prefix(5)).map({ $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! })) + "/top-questions", with: [paging, creationDate, sorting]) { (results: [Question]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersTimeline(ids: [Int],
                       paging: PagingParameters? = nil,
                       creationDate: CreationDateFilterParameters? = nil,
                       completion: @escaping ([UserTimeline], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/timeline", with: [paging, creationDate]) { (results: [UserTimeline]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersTopAnswerTags(id: Int,
                            paging: PagingParameters? = nil,
                            completion: @escaping ([TopTag], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/top-answer-tags", with: [paging]) { (results: [TopTag]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersTopQuestionTags(id: Int,
                              paging: PagingParameters? = nil,
                              completion: @escaping ([TopTag], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/top-question-tags", with: [paging]) { (results: [TopTag]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersTopTags(id: Int,
                      paging: PagingParameters? = nil,
                      completion: @escaping ([TopTag], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/top-tags", with: [paging]) { (results: [TopTag]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersModerators(paging: PagingParameters? = nil,
                         creationDate: CreationDateFilterParameters? = nil,
                         sorting: SortingParameters<UsersSortOption>? = nil,
                         completion: @escaping ([User], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/moderators", with: [paging, creationDate, sorting]) { (results: [User]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersModeratorsElected(paging: PagingParameters? = nil,
                                creationDate: CreationDateFilterParameters? = nil,
                                sorting: SortingParameters<UsersSortOption>? = nil,
                                completion: @escaping ([User], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/moderators/elected", with: [paging, creationDate, sorting]) { (results: [User]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersInbox(id: Int,
                    paging: PagingParameters? = nil,
                    completion: @escaping ([InboxItem], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/inbox", with: [paging]) { (results: [InboxItem]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersInboxUnread(id: Int,
                          paging: PagingParameters? = nil,
                          since: SinceParameter? = nil,
                          completion: @escaping ([InboxItem], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/\(id)/inbox/unread", with: [paging, since]) { (results: [InboxItem]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersAssociated(ids: [Int],
                         paging: PagingParameters? = nil,
                         types: SiteTypesParameter? = nil,
                         completion: @escaping ([NetworkUser], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/associated", with: [paging, types]) { (results: [NetworkUser]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
    
    func usersMerges(ids: [Int],
                     paging: PagingParameters? = nil,
                     completion: @escaping ([AccountMerge], RequestError?, Bool) -> Void)
    {
        makeRequest(to: "users/" + vectorize(parameters: Array(ids.prefix(maxParameterElements))) + "/merges", with: [paging]) { (results: [AccountMerge]?, error: RequestError?, hasMore: Bool?) in
            completion(results ?? [], error, hasMore ?? false)
        }
    }
}
