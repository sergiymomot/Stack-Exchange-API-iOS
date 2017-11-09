//
//  Request.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 8/14/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

open class StackExchangeAPI {
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()
    
    private let apiDomain = "https://api.stackexchange.com/2.2/"
    private let httpErrorCode = 400
    private let siteParameterName = "site"
    private let keyParameterName = "key"
    private let filterParameterName = "filter"
    private let accessTokenParameterName = "access_token"
    public let maxParameterElements = 100
    public let config: StackExchangeAPIConfig
    
    init(withConfig config: StackExchangeAPIConfig) {
        self.config = config
    }
    
    @discardableResult
    open func makeRequest<T: Codable>(to endpoint: String,
                                      with options: [ParametersConvertible?] = [],
                                      isPostRequest: Bool = false,
                                      excludeSiteParameter: Bool = false,
                                      completion: @escaping ([T]?, RequestError?, Bool?) -> Void) -> URLSessionDataTask
    {
        var requestParameters = buildParameters(from: options.flatMap({ $0 }))
        
        //some endpoints do not accept 'site' parameter because they are related to the entire network
        if !excludeSiteParameter {
            requestParameters[siteParameterName] = config.site
        }
        
        requestParameters[keyParameterName] = config.key
        requestParameters[filterParameterName] = config.filter.nameString
        
        if let token = config.accessToken {
            requestParameters[accessTokenParameterName] = token
        }
        
        let request = buildRequest(endpoint: endpoint, isPost: isPostRequest, parameters: requestParameters)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let urlError = error as? URLError, urlError.errorCode == NSURLErrorNotConnectedToInternet {
                completion(nil, .noInternetConnection, nil)
                return
            }
            
            guard let jsonData = data else {
                completion(nil, .noServerResponse, nil)
                return
            }
            
            guard let responseWrapper = try? self.jsonDecoder.decode(ResponseWrapper<T>.self, from: jsonData) else {
                completion(nil, .jsonParsingFailed, nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != self.httpErrorCode else {
                let apiError = APIError(id: responseWrapper.errorID ?? -1,
                                        name: responseWrapper.errorName ?? "Unknown error",
                                        description: responseWrapper.errorMessage ?? "No description.")
                completion(nil, .apiRequestError(error: apiError), nil)
                return
            }
            
            completion(responseWrapper.items, nil, responseWrapper.hasMore)
        }
            
        task.resume()
        
        return task
    }
    
    public func vectorize<T>(parameters: [T]) -> String {
        return parameters.map({ "\($0)" }).joined(separator: ";")
    }
    
    private func buildRequest(endpoint: String, isPost: Bool, parameters: [String: Any]) -> URLRequest {
        let parametersString = parameters.map({ "\($0)=\($1)" }).joined(separator: "&").addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!

        var request = URLRequest(url: URL(string: apiDomain + endpoint + "?" + parametersString)!)
        request.httpMethod = isPost ? "POST" : "GET"
        
        for (key, value) in config.header {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
    private func buildParameters(from options: [ParametersConvertible]) -> [String: Any] {
        var parameters: [String: Any] = [:]
        
        for option in options {
            parameters.merge(option.parameters, uniquingKeysWith: { current, _ in current })
        }
        
        return parameters
    }
}
