//
//  CZExtension.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import UIKit

public final class CZExtension<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol CZExtensionCompatible {
    associatedtype CZBase
    var cz: CZExtension<CZBase> { get }
    static var cz: CZExtension<CZBase>.Type { get }
}

extension CZExtensionCompatible {
    public var cz: CZExtension<Self> { CZExtension(self) }

    public static var cz: CZExtension<Self>.Type { CZExtension<Self>.self }
}

extension NSObject: CZExtensionCompatible {}
