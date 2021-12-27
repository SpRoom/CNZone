//
//  UIView+Event.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/20.
//

import Foundation
import RxGesture
import RxSwift
import UIKit

extension CZExtension where Base: UIView {
    var tap: Observable<Void> {
        base
            .rx
            .tapGesture().when(.recognized).mapToVoid()
            .throttle(.seconds(2), latest: false, scheduler: MainScheduler.instance)
    }
}
