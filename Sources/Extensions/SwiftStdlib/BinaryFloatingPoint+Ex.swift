//
//  BinaryFloatingPoint+Ex.swift
//  Occlusion
//
//  Created by spec on 2021/12/26.
//

import CoreGraphics
import Foundation

extension BinaryFloatingPoint {
    public var bool: Bool {
        self != 0
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }

    public var double: Double {
        Double(self)
    }

    public var float: Float {
        Float(self)
    }

    public var int: Int {
        Int(self)
    }

    public var int8: Int8 {
        Int8(self)
    }

    public var int16: Int16 {
        Int16(self)
    }

    public var int32: Int32 {
        Int32(self)
    }

    public var int64: Int64 {
        Int64(self)
    }

    public var uInt: UInt {
        UInt(self)
    }

    public var uInt8: UInt8 {
        UInt8(self)
    }

    public var uInt16: UInt16 {
        UInt16(self)
    }

    public var uInt32: UInt32 {
        UInt32(self)
    }

    public var uInt64: UInt64 {
        UInt64(self)
    }
}
