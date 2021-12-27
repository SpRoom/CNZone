//
//  Reachability.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/20.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import Reachability
import RxSwift

public func connectedToInternet() -> Observable<Bool> {
    ReachabilityManager.shared.reach
}

public var currentNetIsOnline: Bool {
    ReachabilityManager.shared.isOnline
}

private class ReachabilityManager {
    static let shared = ReachabilityManager()

    private let reachability = try? Reachability()

    var isOnline: Bool {
        _isOnline
    }

    private var _isOnline = false

    let _reach = ReplaySubject<Bool>.create(bufferSize: 1)
    var reach: Observable<Bool> {
        _reach.asObserver()
    }

    init() {
        reachability?.whenReachable = { _ in

            DispatchQueue.main.async {
                self._reach.onNext(true)
                self._isOnline = true
            }
        }

        reachability?.whenUnreachable = { _ in
            DispatchQueue.main.async {
                self._reach.onNext(false)
                self._isOnline = false
            }
        }

        do {
            try reachability?.startNotifier()
            _reach.onNext(reachability?.connection != Optional.none)
        } catch {
            print("Unable to start notifier")
        }
    }
}
