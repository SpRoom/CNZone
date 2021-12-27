//
//  HUD.swift
//  Occlusion
//
//  Created by spec on 2021/12/25.
//

import UIKit

class HUD: NSObject {
    static var shared = HUD(hud: MBHUDTool())

    static func setup(hud: ProgressHUD) {
        shared = HUD(hud: hud)
    }

    private var tool: ProgressHUD

    private init(hud: ProgressHUD) {
        tool = hud
        super.init()
    }

    static func show(_ message: String? = nil, subMessage: String? = nil, type: HUDType, onView: UIView? = nil, time: TimeInterval = 1, callBack: (() -> Void)? = nil) {
        shared.show(message, subMessage: subMessage, type: type, onView: onView, time: time, callBack: callBack)
    }

    static func hide() {
        shared.tool.dismiss()
    }
}

extension HUD {
    public enum HUDType {
        case error, info, success, loading
    }

    func show(_ message: String? = nil, subMessage: String? = nil, type: HUDType, onView: UIView? = nil, time: TimeInterval = 1, callBack: (() -> Void)?) {
        DispatchQueue.main.async { [unowned self] in
            switch type {
            case .error:
                tool.showErr(onView: onView, title: message, subTitle: subMessage)
            case .info:
                tool.showInfo(onView: onView, title: message, subTitle: subMessage)
            case .success:
                tool.showSuccess(onView: onView, title: message, subTitle: subMessage)
            case .loading:
                tool.showLoading(onView: onView, title: message, subTitle: subMessage)
            }

            if type != .loading {
                _ = delay(time, task: {
                    tool.dismiss()
                    callBack?()
                })
            }
        }
    }
}
