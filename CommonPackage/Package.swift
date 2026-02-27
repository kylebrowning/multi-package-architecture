// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CommonPackage",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [
        .library(name: "Env", targets: ["Env"]),
        .library(name: "Logger", targets: ["Logger"]),
        .library(name: "Toolkit", targets: ["Toolkit"]),
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
    ],
    targets: [
        .target(name: "Env"),
        .target(name: "Logger"),
        .target(name: "Toolkit"),
        .target(name: "DesignSystem"),
    ]
)
