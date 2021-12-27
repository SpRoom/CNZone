// FloatExtensions.swift - Copyright 2021 SwifterSwift

#if canImport(CoreGraphics)
import CoreGraphics
#endif

#if os(macOS) || os(iOS)
import Darwin
#elseif os(Linux)
import Glibc
#endif

// MARK: - Properties

extension Float {
    /// SwifterSwift: Int.
    public var int: Int {
        Int(self)
    }

    /// SwifterSwift: Double.
    public var double: Double {
        Double(self)
    }

    #if canImport(CoreGraphics)
    /// SwifterSwift: CGFloat.
    public var cgFloat: CGFloat {
        CGFloat(self)
    }
    #endif
}

// MARK: - Operators

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator **: PowerPrecedence
/// SwifterSwift: Value of exponentiation.
///
/// - Parameters:
///   - lhs: base float.
///   - rhs: exponent float.
/// - Returns: exponentiation result (4.4 ** 0.5 = 2.0976176963).
public func **(lhs: Float, rhs: Float) -> Float {
    // http://nshipster.com/swift-operators/
    pow(lhs, rhs)
}
