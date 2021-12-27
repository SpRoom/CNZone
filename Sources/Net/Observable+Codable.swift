//
//  Observable+Codable.swift
//  kjxq-uikit
//
//  Created by 楠 on 2021/3/25.
//

import Foundation
import Moya
import RxSwift

extension ObservableType where Element == Response {
    public func map<D: Decodable>(to type: D.Type) -> Observable<D> {
        flatMap { response -> Observable<D> in
            Observable.just(try response.map(type))
        }
    }
}

extension Observable where Element: Codable {
    func filterSuccessRequest() -> Observable<Element> {
        asSingle().do(onSuccess: { _ in
        }, onError: { error in
            SNLog("filter map object error: \(error)")
            if let error = error as? APIError {
                MoyaRequestErrorDealWith.errorHUD(error)
            }
        }).asObservable()
    }
}

extension Observable where Element: Sequence, Element.Element: Codable {
    func filterSuccessRequest() -> Observable<Element> {
        asSingle().do(onSuccess: { _ in
        }, onError: { error in
            SNLog("filter map array error: \(error)")
            if let error = error as? APIError {
                MoyaRequestErrorDealWith.errorHUD(error)
            }
        }).asObservable()
    }
}
