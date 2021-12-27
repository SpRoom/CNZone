//
//  UIButton+Ex.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/9.
//

import UIKit

extension UIButton {
    var font: UIFont {
        set {
            titleLabel?.font = newValue
        }
        get {
            titleLabel?.font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        }
    }
}
