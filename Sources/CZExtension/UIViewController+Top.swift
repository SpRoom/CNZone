//
//  UIViewController+Top.swift
//  Occlusion
//
//  Created by spec on 2021/12/9.
//

import Foundation
import UIKit

extension CZExtension where Base: UIViewController {
    public var topViewController: UIViewController {
        base.presentedViewController?.cz.topViewController
            ?? (base as? UITabBarController)?.selectedViewController?.cz.topViewController
            ?? (base as? UINavigationController)?.visibleViewController?.cz.topViewController
            ?? base
    }

    public static var topViewController: UIViewController {
        UIApplication.shared.delegate?.window??.rootViewController?.cz.topViewController ?? UIViewController()
    }

    public func goBack(animated: Bool, completion: (() -> Void)? = nil) {
        if let navigationController = base.navigationController, navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated) { [weak base] in
                guard let _ = base else { return }
                completion?()
            }
        } else if base.presentingViewController != nil {
            base.dismiss(animated: animated, completion: completion)
        }
    }
}

extension UINavigationController {
    fileprivate func popViewController(animated: Bool, completion: @escaping () -> Swift.Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
}

extension CZExtension where Base: UIViewController {
    var safeInset: UIEdgeInsets {
        UIScreen.cz.safeInset
    }

    var safeHeight: CGFloat {
        UIScreen.cz.heightOfSafeArea()
    }

    var sfaeWidth: CGFloat {
        UIScreen.cz.widthOfSafeArea()
    }
}
