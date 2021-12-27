//
//  UIView+Border.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import Foundation
import UIKit

extension CZExtension where Base: UIView {
    var borderColor: UIColor? {
        get {
            guard let color = base.layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                base.layer.borderColor = nil
                return
            }
            // Fix React-Native conflict issue
            guard String(describing: type(of: color)) != "__NSCFType" else { return }
            base.layer.borderColor = color.cgColor
        }
    }

    var borderWidth: CGFloat {
        get {
            base.layer.borderWidth
        }
        set {
            base.layer.borderWidth = newValue
        }
    }

    var cornerRadius: CGFloat {
        get {
            base.layer.cornerRadius
        }
        set {
            base.layer.masksToBounds = true
            base.layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
}
