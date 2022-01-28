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
            targets: ["ActantSDKTargets"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/grpc/grpc-swift", .exact("1.6.1")),
        
        // TODO [smuravev] Здесь дублируем необход зависимости от кот зависит grpc-swift,
        //                 так как известный BUG в SPM:
        //                   - https://stackoverflow.com/questions/65220359/add-package-dependency-for-a-binary-target-with-swift-package-manager
        //                   - https://forums.swift.org/t/swiftpm-binary-target-with-sub-dependencies/40197/13
        //                   - https://bugs.swift.org/browse/SR-14245
        //                 Удалить эти конфигурации, после того как этот дефект будет исправлен в SPM.
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.32.0"),
        .package(url: "https://github.com/apple/swift-nio-http2.git", from: "1.18.2"),
        .package(url: "https://github.com/apple/swift-nio-transport-services.git", from: "1.11.1"),
        .package(url: "https://github.com/apple/swift-nio-extras.git", from: "1.4.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.14.0"),
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
                
                // grpc-swift
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "CGRPCZlib", package: "grpc-swift"),
                
                // TODO [smuravev] Здесь дублируем необход зависимости от кот зависит grpc-swift,
                //                 так как известный BUG в SPM:
                //                   - https://stackoverflow.com/questions/65220359/add-package-dependency-for-a-binary-target-with-swift-package-manager
                //                   - https://forums.swift.org/t/swiftpm-binary-target-with-sub-dependencies/40197/13
                //                   - https://bugs.swift.org/browse/SR-14245
                //                 Удалить эти конфигурации, после того как этот дефект будет исправлен в SPM.
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOConcurrencyHelpers", package: "swift-nio"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "NIOEmbedded", package: "swift-nio"),
                .product(name: "NIOExtras", package: "swift-nio-extras"),
                .product(name: "NIOFoundationCompat", package: "swift-nio"),
                .product(name: "NIOHTTP1", package: "swift-nio"),
                .product(name: "NIOHTTP2", package: "swift-nio-http2"),
                .product(name: "NIOPosix", package: "swift-nio"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
                .product(name: "NIOTLS", package: "swift-nio"),
                .product(name: "NIOTransportServices", package: "swift-nio-transport-services")
            ],
            path: "Sources"
        )
    ]
)
