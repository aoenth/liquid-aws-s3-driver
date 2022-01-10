// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "liquid-aws-s3-driver",
    platforms: [
       .iOS(.v13),
       .macOS(.v10_15),
    ],
    products: [
        .library(name: "LiquidAwsS3Driver", targets: ["LiquidAwsS3Driver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/binarybirds/liquid-kit.git", from: "1.3.3"),
        .package(name: "AWSSwiftSDK", url: "https://github.com/awslabs/aws-sdk-swift", from: "0.1.0"),
    ],
    targets: [
        .target(name: "LiquidAwsS3Driver", dependencies: [
            .product(name: "LiquidKit", package: "liquid-kit"),
            .product(name: "AWSS3", package: "AWSSwiftSDK"),
        ]),
        .testTarget(name: "LiquidAwsS3DriverTests", dependencies: [
            .target(name: "LiquidAwsS3Driver"),
        ]),
    ]
)
