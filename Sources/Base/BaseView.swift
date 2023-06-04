//
//  BaseView.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import RxSwift
import UIKit

open class BaseView: UIView {
    public let disposeBag = DisposeBag()

    public init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
        setupStyle()
        setupBind()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupStyle()
        setupBind()
    }
}

@objc extension BaseView {
    open func setupViews() {}

    open func setupBind() {}

    open func setupStyle() {}
}
