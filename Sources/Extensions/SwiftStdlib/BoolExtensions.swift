// BoolExtensions.swift - Copyright 2020 SwifterSwift

// MARK: - Properties

extension Bool {
    /// SwifterSwift: Return 1 if true, or 0 if false.
    ///
    ///        false.int -> 0
    ///        true.int -> 1
    ///
    public var int: Int {
        self ? 1 : 0
    }

    /// SwifterSwift: Return "true" if true, or "false" if false.
    ///
    ///        false.string -> "false"
    ///        true.string -> "true"
    ///
    public var string: String {
        self ? "true" : "false"
    }
}
