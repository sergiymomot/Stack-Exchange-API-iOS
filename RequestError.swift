//
//  RequestError.swift
//  Stack Exchange API Swift
//
//  Created by Sergiy Momot on 11/8/17.
//  Copyright © 2017 Sergiy Momot. All rights reserved.
//

import Foundation

public enum RequestError: Error {
    case noInternetConnection
    case noServerResponse
    case jsonParsingFailed
    case apiRequestError(error: APIError)
}
