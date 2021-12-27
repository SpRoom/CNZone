//
//  CGFloatExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/23/16.
//  Copyright © 2016 SwifterSwift
//

#if canImport(CoreGraphics)
import CoreGraphics

#if canImport(UIKit)
import UIKit
#endif

#if canImport(Cocoa)
import Cocoa
#endif

// MARK: - Properties

extension CGFloat {
    /// SwifterSwift: Absolute of CGFloat value.
    public var abs: CGFloat {
        Swift.abs(self)
    }

    /// SwifterSwift: Ceil of CGFloat value.
    public var ceil: CGFloat {
        Foundation.ceil(self)
    }

    /// SwifterSwift: Radian value of degree input.
    public var degreesToRadians: CGFloat {
        .pi * self / 180.0
    }

    /// SwifterSwift: Floor of CGFloat value.
    public var floor: CGFloat {
        Foundation.floor(self)
    }

    /// SwifterSwift: Check if CGFloat is positive.
    public var isPositive: Bool {
        self > 0
    }

    /// SwifterSwift: Check if CGFloat is negative.
    public var isNegative: Bool {
        self < 0
    }

    /// SwifterSwift: Int.
    public var int: Int {
        Int(self)
    }

    /// SwifterSwift: Float.
    public var float: Float {
        Float(self)
    }

    /// SwifterSwift: Double.
    public var double: Double {
        Double(self)
    }

    /// SwifterSwift: Degree value of radian input.
    public var radiansToDegrees: CGFloat {
        self * 180 / CGFloat.pi
    }
}

#endif
