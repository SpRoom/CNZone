// swift-tools-version:5.4
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
            .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0"))
        ],
    targets: [
        .target(name: "CNZone",
                      dependencies: [
                        .product(name: "SnapKit", package: "SnapKit"),
                        .product(name: "RxMoya", package: "Moya")
                      ],
                      path: "Sources"),
              
             ],
    swiftLanguageVersions: [.v5]
)
