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
        configHugging()
    }
 
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configHugging()
    }
    
    private func configHugging() {
        setContentHuggingPriority(.defaultHigh, for: .vertical)
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
