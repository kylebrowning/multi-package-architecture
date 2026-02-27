// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MyApp",
    platforms: [.iOS(.v18), .macOS(.v15)],
    dependencies: [
        .package(path: "../CommonPackage"),
        .package(path: "../LandmarksPackage"),
        .package(path: "../ReservationsPackage"),
        .package(path: "../SocialPackage"),
    ],
    targets: [
        .executableTarget(
            name: "MyApp",
            dependencies: [
                .product(name: "Toolkit", package: "CommonPackage"),
                .product(name: "LandmarksDomain", package: "LandmarksPackage"),
                .product(name: "LandmarksFeature", package: "LandmarksPackage"),
                .product(name: "ReservationsDomain", package: "ReservationsPackage"),
                .product(name: "ReservationsFeature", package: "ReservationsPackage"),
                .product(name: "SocialDomain", package: "SocialPackage"),
                .product(name: "SocialFeature", package: "SocialPackage"),
            ]
        ),
    ]
)
