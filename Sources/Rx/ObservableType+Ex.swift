//
//  ObservableType+Ex.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/8.
//

import Foundation
import RxCocoa
import RxSwift

extension ObservableType {
    public func catchErrorJustComplete() -> Observable<Element> {
        `catch` { _ in
            Observable.empty()
        }
    }

    public func asDriverOnErrorJustComplete() -> Driver<Element> {
        asDriver { error in
            assertionFailure("Error \(error)")
            return Driver.empty()
        }
    }

    public func mapToVoid() -> Observable<Void> {
        map { _ in }
    }
}
