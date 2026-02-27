// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "LandmarksPackage",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [
        .library(name: "LandmarksDomain", targets: ["LandmarksDomain"]),
        .library(name: "LandmarksFeature", targets: ["LandmarksFeature"]),
    ],
    dependencies: [
        .package(path: "../CommonPackage"),
    ],
    targets: [
        .target(
            name: "LandmarksApi",
            dependencies: [
                .product(name: "Env", package: "CommonPackage"),
                .product(name: "Toolkit", package: "CommonPackage"),
            ]
        ),
        .target(
            name: "LandmarksDomain",
            dependencies: [
                "LandmarksApi",
                .product(name: "Env", package: "CommonPackage"),
                .product(name: "Toolkit", package: "CommonPackage"),
            ]
        ),
        .target(
            name: "LandmarksFeature",
            dependencies: [
                "LandmarksDomain",
                .product(name: "DesignSystem", package: "CommonPackage"),
                .product(name: "Env", package: "CommonPackage"),
                .product(name: "Toolkit", package: "CommonPackage"),
            ]
        ),

        // Preview Apps
        .executableTarget(
            name: "LandmarksPreviewApp",
            dependencies: ["LandmarksFeature", "LandmarksDomain"]
        ),

        // Tests
        .testTarget(
            name: "LandmarksDomainTests",
            dependencies: ["LandmarksDomain"]
        ),
    ]
)
