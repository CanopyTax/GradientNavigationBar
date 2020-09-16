// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "GradientNavigationBar",
    products: [
        .library(
            name: "GradientNavigationBar",
            targets: ["GradientNavigationBar"]),
    ],
    targets: [
        .target(
            name: "GradientNavigationBar",
            dependencies: [],
            path: "GradientNavigationBar"),
    ]
)
