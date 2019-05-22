// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OslonokkelenSDK",
    products: [
        .library(name: "OslonokkelenSDK", targets: ["OslonokkelenSDK"]),
        .executable(name: "Example", targets: ["Example"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.4.0"),
        .package(url: "https://github.com/daltoniam/Starscream.git", from: "3.1.0"),
    ],
    targets: [
        .target(
            name: "Example",
            dependencies: ["OslonokkelenSDK"]),
        .target(
            name: "OslonokkelenSDK",
            dependencies: ["SwiftProtobuf", "Starscream"]),
        .testTarget(
            name: "OslonokkelenSDKTests",
            dependencies: ["OslonokkelenSDK"]),
    ]
)
