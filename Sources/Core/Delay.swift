//
//  Delay.swift
//  Occlusion
//
//  Created by spec on 2021/12/12.
//

import Foundation

public typealias delay_Task = (_ cancel: Bool) -> Void

public func delay(time: TimeInterval, block: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        block()
    }
}

@discardableResult
public func delay(_ time: TimeInterval, task: @escaping () -> Void) -> delay_Task? {
    func dispatch_later(block: @escaping () -> Void) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    var closure: (() -> Void)? = task
    var result: delay_Task?

    let delayedClosure: delay_Task = {
        cancel in
        if let internalClosure = closure {
            if cancel == false {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }

    result = delayedClosure

    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}

public func cancel(_ task: delay_Task?) {
    task?(true)
}
