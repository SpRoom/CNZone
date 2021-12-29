// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "CNZone",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "CNZone",
                 targets: ["CNZone"])
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxGesture.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.2.0")),
        .package(url: "https://github.com/ashleymills/Reachability.swift.git", .branch("master")),
        .package(url: "https://github.com/jdg/MBProgressHUD.git", .branch("master")),
        .package(url: "https://github.com/malcommac/SwiftDate.git", .upToNextMajor(from: "6.3.1"))
        //        https://github.com/ReactiveX/RxSwift.git
    ],
    targets: [
        .target(name: "CNZone",
                dependencies: [
                    .product(name: "RxSwift", package: "RxSwift", condition: .when(platforms: [.iOS])),
                    .product(name: "RxCocoa", package: "RxSwift", condition: .when(platforms: [.iOS])),
                    .product(name: "RxGesture", package: "RxGesture", condition: .when(platforms: [.iOS])),
                    .product(name: "Reachability", package: "Reachability.swift", condition: .when(platforms: [.iOS])),
                    .product(name: "SnapKit", package: "SnapKit", condition: .when(platforms: [.iOS])),
                    .product(name: "RxMoya", package: "Moya", condition: .when(platforms: [.iOS])),
                    .product(name: "SwiftDate", package: "SwiftDate", condition: .when(platforms: [.iOS])),
                    .product(name: "MBProgressHUD", package: "MBProgressHUD", condition: .when(platforms: [.iOS]))
                ],
                path: "Sources",
                exclude: [],
                resources: [
                    .process("HUD/sources/infomation.png"),
                    .process("HUD/sources/infomation@2x.png"),
                    .process("HUD/sources/infomation@3x.png"),
                    .process("HUD/sources/Checkmark.png"),
                    .process("HUD/sources/Checkmark@2x.png"),
                    .process("HUD/sources/Checkmark@3x.png"),
                ]),
        
    ],
    swiftLanguageVersions: [.v5]
)
