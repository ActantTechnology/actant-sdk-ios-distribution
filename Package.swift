// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ActantSDK",
    platforms: [
        .iOS("14.5")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ActantSDK",
            type: .dynamic,
            targets: ["ActantSDKTargets"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "grpc-swift", url: "https://github.com/grpc/grpc-swift", .exact("1.6.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "ActantSDK",
            path: "ActantSDK.xcframework"
        ),
        .target(
            name: "ActantSDKTargets",
            dependencies: [
                .target(name: "ActantSDK"),
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "CGRPCZlib", package: "grpc-swift")
            ],
            path: "Sources",
            linkerSettings: [
                .linkedFramework("ARKit", .when(platforms: [.iOS])),
            ]
        )
    ]
)
