// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "ReservationsPackage",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [
        .library(name: "ReservationsDomain", targets: ["ReservationsDomain"]),
        .library(name: "ReservationsFeature", targets: ["ReservationsFeature"]),
    ],
    dependencies: [
        .package(path: "../CommonPackage"),
        .package(path: "../LandmarksPackage"),
    ],
    targets: [
        .target(
            name: "ReservationsApi",
            dependencies: [
                .product(name: "Env", package: "CommonPackage"),
                .product(name: "Toolkit", package: "CommonPackage"),
            ]
        ),
        .target(
            name: "ReservationsDomain",
            dependencies: [
                "ReservationsApi",
                .product(name: "LandmarksDomain", package: "LandmarksPackage"),
                .product(name: "Env", package: "CommonPackage"),
                .product(name: "Toolkit", package: "CommonPackage"),
            ]
        ),
        .target(
            name: "ReservationsFeature",
            dependencies: [
                "ReservationsDomain",
                .product(name: "LandmarksDomain", package: "LandmarksPackage"),
                .product(name: "DesignSystem", package: "CommonPackage"),
                .product(name: "Env", package: "CommonPackage"),
                .product(name: "Toolkit", package: "CommonPackage"),
            ]
        ),

        // Preview Apps
        .executableTarget(
            name: "ReservationsPreviewApp",
            dependencies: [
                "ReservationsFeature",
                "ReservationsDomain",
                .product(name: "LandmarksDomain", package: "LandmarksPackage"),
            ]
        ),

        // Tests
        .testTarget(
            name: "ReservationsDomainTests",
            dependencies: ["ReservationsDomain"]
        ),
    ]
)
