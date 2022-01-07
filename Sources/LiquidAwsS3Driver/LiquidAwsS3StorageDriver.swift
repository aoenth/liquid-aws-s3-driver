//
//  LiquidAwsS3StorageDriver.swift
//  LiquidAwsS3Driver
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import LiquidKit

/// the storage driver is responsible for creating the AWS S3 storage object with the given configuration and the underlying AWS Client with the right credentials
struct LiquidAwsS3StorageDriver: FileStorageDriver {

    /// AWS S3 Storage Configuration object
    let configuration: LiquidAWSS3StorageConfiguration
    
    /// private shared AWSClient object (personal note: I don't like this static approach...)
    private static var client: AWSClient!
    
    init(configuration: LiquidAWSS3StorageConfiguration) {
        self.configuration = configuration
        Self.client = AWSClient(credentialProvider: configuration.credentialProvider, httpClientProvider: .createNew)
    }

    /// creates a new AWS S3 based FileStorage object
    func makeStorage(with context: FileStorageContext) -> FileStorage {
        LiquidAWSS3Storage(configuration: configuration, context: context, client: Self.client)
    }

    /// shutdown the AWSClient if needed
    func shutdown() {
        try? Self.client.syncShutdown()
    }
}
