// DecodableExtensions.swift - Copyright 2020 SwifterSwift

#if canImport(Foundation)
import Foundation
#endif

extension Decodable {
    #if canImport(Foundation)
    /// SwifterSwift: Parsing the model in Decodable type.
    /// - Parameters:
    ///   - data: Data.
    ///   - decoder: JSONDecoder. Initialized by default.
    public init?(from data: Data, using decoder: JSONDecoder = .init()) {
        guard let parsed = try? decoder.decode(Self.self, from: data) else { return nil }
        self = parsed
    }
    #endif
}
