// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SwiftUIToast",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SwiftUIToast",
            targets: ["SwiftUIToast"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUIToast",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftUIToastTests",
            dependencies: ["SwiftUIToast"]
        ),
    ]
)