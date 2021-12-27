//
//  UIVeiwController+Ex.swift
//  Occlusion
//
//  Created by spec on 2021/12/25.
//

import UIKit

extension UIViewController {
    func becomeRootViewController(_ callBack: (() -> Void)? = nil) {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        UIView.transition(with: window, duration: 0.3, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            let oldeState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            window.rootViewController = self
            window.makeKeyAndVisible()
            UIView.setAnimationsEnabled(oldeState)
        }) { _ in
            callBack?()
        }
    }
}
