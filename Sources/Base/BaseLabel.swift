//
//  BaseLabel.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/8.
//

import Foundation
import UIKit

open class BaseLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setContentHuggingPriority(.defaultHigh, for: .vertical)
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
