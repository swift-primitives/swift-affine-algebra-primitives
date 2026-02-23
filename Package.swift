// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-algebra-affine-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Algebra Affine Primitives",
            targets: ["Algebra Affine Primitives"]
        ),
        .library(
            name: "Algebra Affine Primitives Test Support",
            targets: ["Algebra Affine Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(path: "../swift-algebra-group-primitives"),
        .package(path: "../swift-affine-primitives"),
    ],
    targets: [
        .target(
            name: "Algebra Affine Primitives",
            dependencies: [
                .product(name: "Algebra Group Primitives", package: "swift-algebra-group-primitives"),
                .product(name: "Affine Primitives", package: "swift-affine-primitives"),
            ]
        ),
        .target(
            name: "Algebra Affine Primitives Test Support",
            dependencies: [
                "Algebra Affine Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Algebra Affine Primitives Tests",
            dependencies: [
                "Algebra Affine Primitives",
                "Algebra Affine Primitives Test Support",
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
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableExperimentalFeature("SuppressedAssociatedTypesWithDefaults"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
