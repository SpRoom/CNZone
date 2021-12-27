//
//  AdapterTarget.swift
//  Occlusion
//
//  Created by Spec on 2021/12/6.
//

import UIKit

public protocol AdapterTarget {}

extension AdapterTarget {
    public var fit: CGFloat {
        fitAdapter(self)
    }
}

extension Int: AdapterTarget {}

extension UInt: AdapterTarget {}

extension Float: AdapterTarget {}

extension Double: AdapterTarget {}

extension CGFloat: AdapterTarget {}
