// SignedIntegerExtensions.swift - Copyright 2020 SwifterSwift

//
//  SignedIntegerExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/15/17.
//  Copyright © 2017 SwifterSwift
//
#if canImport(Foundation)
import Foundation
#endif

// MARK: - Properties

extension SignedInteger {
    /// SwifterSwift: Absolute value of integer number.
    public var abs: Self {
        Swift.abs(self)
    }

    /// SwifterSwift: Check if integer is positive.
    public var isPositive: Bool {
        self > 0
    }

    /// SwifterSwift: Check if integer is negative.
    public var isNegative: Bool {
        self < 0
    }

    /// SwifterSwift: Check if integer is even.
    public var isEven: Bool {
        (self % 2) == 0
    }

    /// SwifterSwift: Check if integer is odd.
    public var isOdd: Bool {
        (self % 2) != 0
    }

    /// SwifterSwift: String of format (XXh XXm) from seconds Int.
    public var timeString: String {
        guard self > 0 else {
            return "0 sec"
        }
        if self < 60 {
            return "\(self) sec"
        }
        if self < 3600 {
            return "\(self / 60) min"
        }
        let hours = self / 3600
        let mins = (self % 3600) / 60

        if hours != 0, mins == 0 {
            return "\(hours)h"
        }
        return "\(hours)h \(mins)m"
    }
}

// MARK: - Methods

extension SignedInteger {
    /// SwifterSwift: Greatest common divisor of integer value and n.
    ///
    /// - Parameter number: integer value to find gcd with.
    /// - Returns: greatest common divisor of self and n.
    public func gcd(of number: Self) -> Self {
        number == 0 ? self : number.gcd(of: self % number)
    }

    /// SwifterSwift: Least common multiple of integer and n.
    ///
    /// - Parameter number: integer value to find lcm with.
    /// - Returns: least common multiple of self and n.
    public func lcm(of number: Self) -> Self {
        (self * number).abs / gcd(of: number)
    }

    #if canImport(Foundation)
    /// SwifterSwift: Ordinal representation of an integer.
    ///
    ///        print((12).ordinalString()) // prints "12th"
    ///
    /// - Parameter locale: locale, default is .current.
    /// - Returns: string ordinal representation of number in specified locale language. E.g. input 92, output in "en": "92nd".
    @available(macOS 10.11, *)
    public func ordinalString(locale: Locale = .current) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .ordinal
        guard let number = self as? NSNumber else { return nil }
        return formatter.string(from: number)
    }
    #endif
}
