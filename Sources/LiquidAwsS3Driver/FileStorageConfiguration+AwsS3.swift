//
//  FileStorageConfigurationFactory.swift
//  LiquidAwsS3Driver
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//
import LiquidKit

public struct S3Credentials {
    let accessKeyID: String
    let secretAccessKey: String
}

public extension FileStorageConfigurationFactory {

    /// creates a new Liquid FileStorageConfigurationFactory object using the provided S3 configuration 
    static func awsS3(credentials: S3Credentials,
                      region: String,
                      bucket: S3Bucket,
                      endpoint: String? = nil) -> FileStorageConfigurationFactory {
        .init {
            LiquidAWSS3StorageConfiguration(credentialProvider: credentialProvider,
                                            region: region,
                                            bucket: bucket,
											endpoint: endpoint,
											kind: .awsS3)
        }
    }
}
