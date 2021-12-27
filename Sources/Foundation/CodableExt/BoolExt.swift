//
//  File.swift
//
//
//  Created by Spec on 2021/1/22.
//

import Foundation
extension Bool {
    public enum False: DefaultValue {
        public static let defaultValue = false
    }

    public enum True: DefaultValue {
        public static let defaultValue = true
    }
}

extension Default {
    public typealias True = Default<Bool.True>
    public typealias False = Default<Bool.False>
}
