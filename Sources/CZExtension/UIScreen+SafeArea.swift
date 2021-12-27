//
//  UIScreen+SafeArea.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/10.
//

import Foundation
import UIKit

extension CZExtension where Base: UIScreen {
    static var safeInset: UIEdgeInsets {
        let insets = UIApplication.shared.delegate?.window??.safeAreaInsets ?? .zero
        return insets
    }

    /// safe area width
    static func widthOfSafeArea() -> CGFloat {
        guard let rootView = UIApplication.shared.keyWindow else { return 0 }

        if #available(iOS 11.0, *) {
            let leftInset = rootView.safeAreaInsets.left

            let rightInset = rootView.safeAreaInsets.right

            return rootView.bounds.width - leftInset - rightInset

        } else {
            return rootView.bounds.width
        }
    }

    /// safe area height
    static func heightOfSafeArea() -> CGFloat {
        guard let rootView = UIApplication.shared.keyWindow else { return 0 }

        if #available(iOS 11.0, *) {
            let topInset = rootView.safeAreaInsets.top

            let bottomInset = rootView.safeAreaInsets.bottom

            return rootView.bounds.height - topInset - bottomInset

        } else {
            return rootView.bounds.height
        }
    }
}
