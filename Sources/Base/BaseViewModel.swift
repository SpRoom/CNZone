//
//  BaseViewModel.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/15.
//

import Foundation
import RxSwift

public class BaseViewModel: NSObject {
    public let disposeBag = DisposeBag()

    override public init() {
        super.init()

        loadData()
    }
}

extension BaseViewModel {
    @objc public func loadData() {}
}
