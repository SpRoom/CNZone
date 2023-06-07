//
//  File.swift
//
//
//  Created by Spec on 2020/11/24.
//

import Foundation
import Moya

public struct ParamLogPlugin: PluginType {
    
    public init() {}
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        request
    }

    public func willSend(_ request: RequestType, target: TargetType) {
        if let urlRequest = request.request {
            print("--------------------")
            print("moya - request - log, time = \(Date())")
            print("----")
            request.sessionHeaders
            pluginPrint("request url - \(urlRequest.url?.absoluteString ?? "unkown request address")")
            pluginPrint("request method - \(urlRequest.method?.rawValue ?? "unkown")")
            let headers = urlRequest.headers.dictionary
            pluginPrint("request headers - ", headers)
            if urlRequest.method == .post {
                if let body = urlRequest.httpBody {
                    pluginPrint(String(data: body, encoding: .utf8) ?? "request body convert to string failed")
                } else {
                    pluginPrint("no http body")
                }
            }
            print("--------------------")
            print("")
        }
    }

    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        print("--------------------")
        print("moya - response - log, time = \(Date())")
        print("----")
        pluginPrint("response url - \(target.baseURL.absoluteString)")
        pluginPrint("response path - \(target.path)")
        switch result {
        case let .success(response):
            pluginPrint("status code: \(response.statusCode)")
            pluginPrint(String(data: response.data, encoding: .utf8) ?? "response body convert to string failed")
        case let .failure(moyaError):
            pluginPrint("response error - \(moyaError.errorDescription ?? "unkown")")
        }
        print("--------------------")
        print("")
    }

    func pluginPrint(_ items: Any...) {
//        print("--------------------")
//        print("moya - paramter - log, time = \(Date())")
//        print("----")
        for item in items {
            if JSONSerialization.isValidJSONObject(item) {
                print(String(data: try! JSONSerialization.data(withJSONObject: item, options: .prettyPrinted), encoding: .utf8)!)
            } else {
                print(item)
            }
        }
//        print("--------------------")
//        print("")
    }
}
