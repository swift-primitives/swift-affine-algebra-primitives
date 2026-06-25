// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-affine-algebra-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Affine Algebra Primitives",
            targets: ["Affine Algebra Primitives"]
        ),
        .library(
            name: "Affine Algebra Primitives Test Support",
            targets: ["Affine Algebra Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-algebra-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-affine-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Affine Algebra Primitives",
            dependencies: [
                .product(name: "Algebra Group Primitives", package: "swift-algebra-primitives"),
                .product(name: "Affine Primitives", package: "swift-affine-primitives"),
            ]
        ),
        .target(
            name: "Affine Algebra Primitives Test Support",
            dependencies: [
                "Affine Algebra Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Affine Algebra Primitives Tests",
            dependencies: [
                "Affine Algebra Primitives",
                "Affine Algebra Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
