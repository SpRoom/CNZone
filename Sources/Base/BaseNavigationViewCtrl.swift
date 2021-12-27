//
//  BaseNavigationViewCtrl.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/8.
//

import UIKit

public class BaseNavigationController: UINavigationController {
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseNavigationController {
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if !children.isEmpty {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}

public class NavigationController: BaseNavigationController {
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            // Fallback on earlier versions
            return .default
        }
    }
}
