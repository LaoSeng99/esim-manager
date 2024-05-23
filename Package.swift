// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "EsimManager",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "EsimManager",
            targets: ["EsimManagerPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "EsimManagerPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/EsimManagerPlugin"),
        .testTarget(
            name: "EsimManagerPluginTests",
            dependencies: ["EsimManagerPlugin"],
            path: "ios/Tests/EsimManagerPluginTests")
    ]
)