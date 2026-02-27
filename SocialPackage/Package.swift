// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SocialPackage",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [
        .library(name: "SocialDomain", targets: ["SocialDomain"]),
        .library(name: "SocialFeature", targets: ["SocialFeature"]),
    ],
    dependencies: [
        .package(path: "../CommonPackage"),
        .package(path: "../LandmarksPackage"),
    ],
    targets: [
        .target(
            name: "SocialApi",
            dependencies: [
                .product(name: "Env", package: "CommonPackage"),
                .product(name: "Toolkit", package: "CommonPackage"),
            ]
        ),
        .target(
            name: "SocialDomain",
            dependencies: [
                "SocialApi",
                .product(name: "LandmarksDomain", package: "LandmarksPackage"),
                .product(name: "Env", package: "CommonPackage"),
                .product(name: "Toolkit", package: "CommonPackage"),
            ]
        ),
        .target(
            name: "SocialFeature",
            dependencies: [
                "SocialDomain",
                .product(name: "DesignSystem", package: "CommonPackage"),
                .product(name: "Env", package: "CommonPackage"),
                .product(name: "Toolkit", package: "CommonPackage"),
            ]
        ),
    ]
)
