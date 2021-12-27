//
//  UIColor+Ex.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import UIKit

extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }

    public convenience init(hexadecimal netHex: Int, alpha: CGFloat = 1.0) {
        self.init(red: (netHex >> 16) & 0xFF, green: (netHex >> 8) & 0xFF, blue: netHex & 0xFF, alpha: alpha)
    }
}
