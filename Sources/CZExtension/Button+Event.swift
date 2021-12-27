//
//  Button+Event.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

extension CZExtension where Base: UIButton {
    public var tap: Observable<Void> {
        base
            .rx
            .tap
            .throttle(.seconds(2), latest: false, scheduler: MainScheduler.instance)
    }
}
