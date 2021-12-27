//
//  ProgressHUD.swift
//  Occlusion
//
//  Created by spec on 2021/12/25.
//

import UIKit

public protocol ProgressHUD {
    func dismiss()

    func showLoading(onView view: UIView?, title: String?, subTitle: String?)

    func showSuccess(onView view: UIView?, title: String?, subTitle: String?)

    func showInfo(onView view: UIView?, title: String?, subTitle: String?)

    func showErr(onView view: UIView?, title: String?, subTitle: String?)
}
