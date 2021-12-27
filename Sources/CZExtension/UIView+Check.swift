//
//  UIView+Check.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import Foundation
import UIKit

extension CZExtension where Base: UIView {
    /// SwifterSwift: Check if view is in RTL format.
    var isRightToLeft: Bool {
        if #available(iOS 10.0, macCatalyst 13.0, tvOS 10.0, *) {
            return base.effectiveUserInterfaceLayoutDirection == .rightToLeft
        } else {
            return false
        }
    }
}
