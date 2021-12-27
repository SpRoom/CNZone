// swift-tools-version:5.0
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
            .package(url: "https://github.com/jdg/MBProgressHUD.git", .branch("master"))
//        https://github.com/ReactiveX/RxSwift.git
        ],
    targets: [
        .target(name: "CNZone",
                      dependencies: [
                        .product(name: "RxSwift"),
                        .product(name: "RxCocoa"),
                        .product(name: "RxGesture"),
                        .product(name: "Reachability"),
                        .product(name: "SnapKit", package: "SnapKit"),
                        .product(name: "RxMoya", package: "Moya"),
                        .product(name: "MBProgressHUD")
                      ],
                      path: "Sources"),
              
             ],
    swiftLanguageVersions: [.v5]
)
