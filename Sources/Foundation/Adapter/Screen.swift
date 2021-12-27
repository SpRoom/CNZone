//
//  Screen.swift
//  Occlusion
//
//  Created by Spec on 2021/12/6.
//

import UIKit

/* ScreenAddapter */

public let ScreenW = UIScreen.main.bounds.width

public let ScreenH = UIScreen.main.bounds.height

/// UI设计图 px
var annotationType: UIAnnotationType = .pt
var designWidth: CGFloat = 375.0

/// 适配数值
func fitAdapter(_ attribute: AdapterTarget) -> CGFloat {
    //    return adjustSizeWithUiDesign(attribute: attribute, UiDesignWidth: designWidth)

    let attribute = CGFloat(truncating: attribute as! NSNumber)

    return adjustSize(attribute: attribute)
}

public enum UIAnnotationType: Int {
    case px = 0, pt
}

// 用于屏幕设配 等比例方法缩小
private func adjustSize(attribute: CGFloat) -> CGFloat {
    if annotationType == .px {
        let scale = UIScreen.main.scale
        let widthPx = ScreenW * scale

        let rate = widthPx / designWidth

        let result = attribute * rate

        return result
    } else {
        let rate = ScreenW / designWidth
        let result = attribute * rate

        return result
    }
}
