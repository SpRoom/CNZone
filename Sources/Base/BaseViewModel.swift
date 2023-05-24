//
//  BaseViewModel.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/15.
//

import Foundation
import RxSwift

open class BaseViewModel: NSObject {

    override public init() {
        super.init()

        loadData()
    }
}

extension BaseViewModel {
    @objc open func loadData() {}
}
