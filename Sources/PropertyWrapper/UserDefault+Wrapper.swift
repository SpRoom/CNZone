//
//  UserDefault+Wrapper.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/10.
//

import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {
    let key: String
    let defaultValue: T

    /// UserDefault 默认参数
    /// - Parameter key: 储存关键字
    /// - Parameter defaultValue: 默认储存对象
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.data(forKey: key) else { return defaultValue }
            let model = try? JSONDecoder().decode(T.self, from: data)
            return model ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
