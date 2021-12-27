//
//  UIView+Ges.swift
//  Occlusion
//
//  Created by spec on 2021/12/11.
//

import Foundation
import UIKit

extension CZExtension where Base: UIView {
    public func addTap(_ target: Any, action: Selector) {
        let ges = UITapGestureRecognizer(target: target, action: action)
        base.addGestureRecognizer(ges)
        base.isUserInteractionEnabled = true
    }
}
