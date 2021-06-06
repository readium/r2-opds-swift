// swift-tools-version:5.3
//
//  Copyright 2021 Readium Foundation. All rights reserved.
//  Use of this source code is governed by the BSD-style license
//  available in the top-level LICENSE file of the project.
//

import PackageDescription

let package = Package(
    name: "ReadiumOPDS",
    defaultLocalization: "en",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "ReadiumOPDS",
            targets: ["ReadiumOPDS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/cezheng/Fuzi.git", .exact("3.1.3")),
        .package(name: "R2Shared", url: "https://github.com/readium/r2-shared-swift.git", .branch("develop")),
    ],
    targets: [
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
