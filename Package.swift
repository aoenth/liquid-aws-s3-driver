// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "liquid-aws-s3-driver",
    platforms: [
       .iOS(.v13),
       .macOS(.v12),
    ],
    products: [
        .library(name: "LiquidAWSS3Driver", targets: ["LiquidAWSS3Driver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/aoenth/liquid-kit.git", from: "1.3.6"),
        .package(name: "AWSSwiftSDK", url: "https://github.com/awslabs/aws-sdk-swift", from: "0.19.0"),
    ],
    targets: [
        .target(name: "LiquidAWSS3Driver", dependencies: [
            .product(name: "LiquidKit", package: "liquid-kit"),
            .product(name: "AWSS3", package: "AWSSwiftSDK"),
        ]),
        .testTarget(name: "LiquidAWSS3DriverTests", dependencies: [
            .target(name: "LiquidAWSS3Driver"),
        ]),
    ]
)
