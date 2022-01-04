//
//  File.swift
//
//
//  Created by apple on 2021/3/3.
//
#if canImport(CryptoKit)
import Foundation

extension Encodable {
    // if nil returen false
    // if not compare same return false
    // if can not encoder to json str, return false
    @available(iOS 13.0, *)
    public func compare(same object: Encodable?) -> Bool {
        guard let object = object else {
            return false
        }
        guard let cstr = jsonStr else {
            return false
        }
        guard let ostr = object.jsonStr else {
            return false
        }
        return SPCrypto.encodeWithMD5(content: cstr) == SPCrypto.encodeWithMD5(content: ostr)
    }
}
#endif
