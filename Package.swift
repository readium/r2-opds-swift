// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReadiumOPDS",
    defaultLocalization: "en",
    platforms: [.iOS(.v10), .macOS("10.11"), .tvOS(.v9)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ReadiumOPDS",
            targets: ["ReadiumOPDS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/cezheng/Fuzi.git", .exact("3.1.3")),
        .package(name: "R2Shared", path: "../r2-shared-swift")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ReadiumOPDS",
            dependencies: ["Fuzi", "R2Shared"],
            path: "./readium-opds/",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "r2-opds-swiftTests",
            dependencies: ["ReadiumOPDS"],
            path: "./readium-opdsTests/",
            exclude: ["Info.plist"],
            resources: [
                .copy("Samples")
            ]
        )
    ]
)
