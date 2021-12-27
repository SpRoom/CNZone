//
//  MoyaRequestErrorDealWith.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/17.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import PKHUD

struct MoyaRequestErrorDealWith {
    static func errorHUD(_ error: APIError) {
        switch error {
        case let .fail(code: code, msg: msg):
            if !specialError(code: code, msg: msg) {
                DispatchQueue.global(qos: .default).async {
                    DispatchQueue.main.async {
//                        SZHUD(msg, type: .info, time: 3, callBack: nil)
                    }
                }
            }
        default:
            break
        }
    }

    /// 是否需要特殊处理的错误码
    ///
    /// - Parameter code: 错误码
    static func specialError(code: String, msg: String) -> Bool {
        if code == reloginCode {
            alertUserRelogin()
            return true
        }

        return false
    }

    static var reloginCode: String {
        "1002" // Configs.Code.unlogin
    }

    static var reloginAlert = true
}

extension MoyaRequestErrorDealWith {
    static func alertUserRelogin() {
        guard !reloginAlert else {
            return
        }
        let vc = LoginCtrl()
        vc.becomeRootViewController(nil)
    }
}
