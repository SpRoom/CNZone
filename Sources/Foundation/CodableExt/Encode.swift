//
//  File.swift
//
//
//  Created by apple on 2021/3/3.
//

import Foundation

extension Encodable {
    public func serialize() throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(self)
    }

    public var jsonStr: String? {
        String(data: try! serialize(), encoding: .utf8) ?? nil
    }

    public func toJSONDic() -> [String: Any]? {
        var data: Data?
        if data == nil, let string = self as? String {
            data = string.data(using: .utf8)
        }
        if data == nil {
            data = try? serialize()
        }
        guard let finalData = data else {
            return nil
        }
        guard let jsonObect = try? JSONSerialization.jsonObject(with: finalData, options: .allowFragments) else {
            return nil
        }
        return jsonObect as? [String: Any]
    }
}
