//
//  Adapter+Font.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import UIKit

extension CZExtension where Base: UIFont {
    public static func light(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size.fit, weight: .light)
    }

    public static func regular(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size.fit, weight: .regular)
    }

    public static func medium(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size.fit, weight: .medium)
    }

    public static func semiBold(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size.fit, weight: .semibold)
    }

    public static func bold(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size.fit, weight: .bold)
    }
}
