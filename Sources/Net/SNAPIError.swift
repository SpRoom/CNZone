//
//  SNAPIError.swift
//  Syntax-SNSwfitPackage
//
//  Created by ios-spec on 2018/12/28.
//  Copyright © 2018 zsh. All rights reserved.
//

import Foundation

public enum APIError: Swift.Error {
    case notLoggedIn
    case fail(code: String, msg: String)
    case mappingError
}

extension APIError {
    public var errCode: String {
        switch self {
        case .notLoggedIn:
            return "999999"
        case .mappingError:
            return "999998"
        case let .fail(code, _):
            return code
        }
    }
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notLoggedIn:
            return "you not login and you need sign in"
        case .mappingError:
            return "parse object failed"
        case let .fail(_, msg: msg):
            return msg
        }
    }
}
