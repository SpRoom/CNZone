//
//  File.swift
//
//
//  Created by Spec on 2021/1/7.
//
#if canImport(CryptoKit)
import CryptoKit
import Foundation

public enum SPCrypto {
    @available(iOS 13.0, *)
    public static func encodeWithMD5(content: String, uppercase: Bool = false) -> String {
        let digest = Insecure.MD5.hash(data: Data(content.utf8))
        let str = digest.map { String(format: "%02hhx", $0) }.joined()
        if uppercase {
            return str.uppercased()
        } else {
            return str
        }
    }
}
#endif
