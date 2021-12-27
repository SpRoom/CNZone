//
//  Observable+Equatable.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/8.
//

import Foundation
import RxSwift

extension Observable where Element: Equatable {
    public func ignore(value: Element) -> Observable<Element> {
        filter { selfE -> Bool in
            value != selfE
        }
    }
}
