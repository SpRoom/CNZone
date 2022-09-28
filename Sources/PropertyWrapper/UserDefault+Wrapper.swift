//
//  UserDefault+Wrapper.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/10.
//

import Foundation

@propertyWrapper
public struct UserDefault<T: Codable> {
    let key: String
    let defaultValue: T

    /// UserDefault 默认参数
    /// - Parameter key: 储存关键字
    /// - Parameter defaultValue: 默认储存对象
    public init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.data(forKey: key) else { return defaultValue }
            if #available(iOS 13.0, *) {
                let model = try? JSONDecoder().decode(T.self, from: data)
                return model ?? defaultValue
            } else {
                if let model = try? JSONDecoder().decode(T.self, from: data) {
                    return model
                } else if let dic = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    if let model = dic[key] as? T {
                        return model
                    }
                }
            }
            return defaultValue
        }
        set {
            if #available(iOS 13.0, *) {
                //Do the JSONEncoder thing
                let data = try? JSONEncoder().encode(newValue)
                UserDefaults.standard.set(data, forKey: key)
            } else {
                //Do the JSONSerialization Thing
                if let data = try? JSONEncoder().encode(newValue) {
//                    let data = try? JSONSerialization.data(withJSONObject: newValue, options: [])
                    UserDefaults.standard.set(data, forKey: key)
                } else {
                    let dic = [key: newValue]
                    let data = try? JSONSerialization.data(withJSONObject: dic, options: [])
                    UserDefaults.standard.set(data, forKey: key)
                }
            }
            
        }
    }
}
