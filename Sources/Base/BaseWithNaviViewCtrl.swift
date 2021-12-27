//
//  BaseWithNaviViewCtrl.swift
//  Occlusion
//
//  Created by Spec on 2021/12/6.
//

import UIKit

class BaseWithNaviViewCtrl: BaseViewCtrl {
    lazy var navBar = EFNavigationBar.CustomNavigationBar()

    override func setupViews() {
        super.setupViews()

        view.addSubview(navBar)

        if navigationController?.children.count != 1 {
            navBar.addBackBtn()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}
