// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// TODO [smuravev] ВНИМАНИЕ: Сейчас SPM не работает.
//                 перейдем на него только когда пофиксят известный BUG SPM (binaryTarget и цепочка зависимостей):
//                   - https://stackoverflow.com/questions/65220359/add-package-dependency-for-a-binary-target-with-swift-package-manager
//                   - https://forums.swift.org/t/swiftpm-binary-target-with-sub-dependencies/40197/13
//                   - https://bugs.swift.org/browse/SR-14245

let package = Package(
    name: "ActantSDK",
    platforms: [
        .iOS("14.5")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ActantSDK",
            targets: ["ActantSDKTargets"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/grpc/grpc-swift", .exact("1.6.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "ActantSDKFramework",
            path: "ActantSDK.xcframework"
        ),
        .target(
            name: "ActantSDKDependencies",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "CGRPCZlib", package: "grpc-swift"),
            ],
            path: "Sources/ActantSDKDependencies"
        ),
        .target(
            name: "ActantSDKTargets",
            dependencies: [
                .target(name: "ActantSDKFramework"),
                .target(name: "ActantSDKDependencies"),
            ],
            path: "Sources/ActantSDKTargets"
        )
    ]
)
