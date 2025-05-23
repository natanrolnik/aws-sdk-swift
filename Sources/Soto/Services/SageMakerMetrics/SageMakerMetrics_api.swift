//===----------------------------------------------------------------------===//
//
// This source file is part of the Soto for AWS open source project
//
// Copyright (c) 2017-2024 the Soto project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Soto project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/soto-project/soto-codegenerator.
// DO NOT EDIT.

#if os(Linux) && compiler(<5.10)
// swift-corelibs-foundation hasn't been updated with Sendable conformances
@preconcurrency import Foundation
#else
import Foundation
#endif
@_exported import SotoCore

/// Service object for interacting with AWS SageMakerMetrics service.
///
/// Contains all data plane API operations and data types for Amazon SageMaker Metrics.  Use these APIs to put and retrieve (get) features related to your training run.    BatchPutMetrics
public struct SageMakerMetrics: AWSService {
    // MARK: Member variables

    /// Client used for communication with AWS
    public let client: AWSClient
    /// Service configuration
    public let config: AWSServiceConfig

    // MARK: Initialization

    /// Initialize the SageMakerMetrics client
    /// - parameters:
    ///     - client: AWSClient used to process requests
    ///     - region: Region of server you want to communicate with. This will override the partition parameter.
    ///     - partition: AWS partition where service resides, standard (.aws), china (.awscn), government (.awsusgov).
    ///     - endpoint: Custom endpoint URL to use instead of standard AWS servers
    ///     - middleware: Middleware chain used to edit requests before they are sent and responses before they are decoded 
    ///     - timeout: Timeout value for HTTP requests
    ///     - byteBufferAllocator: Allocator for ByteBuffers
    ///     - options: Service options
    public init(
        client: AWSClient,
        region: SotoCore.Region? = nil,
        partition: AWSPartition = .aws,
        endpoint: String? = nil,
        middleware: AWSMiddlewareProtocol? = nil,
        timeout: TimeAmount? = nil,
        byteBufferAllocator: ByteBufferAllocator = ByteBufferAllocator(),
        options: AWSServiceConfig.Options = []
    ) {
        self.client = client
        self.config = AWSServiceConfig(
            region: region,
            partition: region?.partition ?? partition,
            serviceName: "SageMakerMetrics",
            serviceIdentifier: "metrics.sagemaker",
            signingName: "sagemaker",
            serviceProtocol: .restjson,
            apiVersion: "2022-09-30",
            endpoint: endpoint,
            variantEndpoints: Self.variantEndpoints,
            middleware: middleware,
            timeout: timeout,
            byteBufferAllocator: byteBufferAllocator,
            options: options
        )
    }




    /// FIPS and dualstack endpoints
    static var variantEndpoints: [EndpointVariantType: AWSServiceConfig.EndpointVariant] {[
        [.fips]: .init(endpoints: [
            "ca-central-1": "metrics-fips.sagemaker.ca-central-1.amazonaws.com",
            "ca-west-1": "metrics-fips.sagemaker.ca-west-1.amazonaws.com",
            "us-east-1": "metrics-fips.sagemaker.us-east-1.amazonaws.com",
            "us-east-2": "metrics-fips.sagemaker.us-east-2.amazonaws.com",
            "us-west-1": "metrics-fips.sagemaker.us-west-1.amazonaws.com",
            "us-west-2": "metrics-fips.sagemaker.us-west-2.amazonaws.com"
        ])
    ]}

    // MARK: API Calls

    /// Used to retrieve training metrics from SageMaker.
    @Sendable
    @inlinable
    public func batchGetMetrics(_ input: BatchGetMetricsRequest, logger: Logger = AWSClient.loggingDisabled) async throws -> BatchGetMetricsResponse {
        try await self.client.execute(
            operation: "BatchGetMetrics", 
            path: "/BatchGetMetrics", 
            httpMethod: .POST, 
            serviceConfig: self.config, 
            input: input, 
            logger: logger
        )
    }
    /// Used to retrieve training metrics from SageMaker.
    ///
    /// Parameters:
    ///   - metricQueries: Queries made to retrieve training metrics from SageMaker.
    ///   - logger: Logger use during operation
    @inlinable
    public func batchGetMetrics(
        metricQueries: [MetricQuery]? = nil,
        logger: Logger = AWSClient.loggingDisabled        
    ) async throws -> BatchGetMetricsResponse {
        let input = BatchGetMetricsRequest(
            metricQueries: metricQueries
        )
        return try await self.batchGetMetrics(input, logger: logger)
    }

    /// Used to ingest training metrics into SageMaker. These metrics can be visualized in SageMaker Studio.
    @Sendable
    @inlinable
    public func batchPutMetrics(_ input: BatchPutMetricsRequest, logger: Logger = AWSClient.loggingDisabled) async throws -> BatchPutMetricsResponse {
        try await self.client.execute(
            operation: "BatchPutMetrics", 
            path: "/BatchPutMetrics", 
            httpMethod: .PUT, 
            serviceConfig: self.config, 
            input: input, 
            logger: logger
        )
    }
    /// Used to ingest training metrics into SageMaker. These metrics can be visualized in SageMaker Studio.
    ///
    /// Parameters:
    ///   - metricData: A list of raw metric values to put.
    ///   - trialComponentName: The name of the Trial Component to associate with the metrics. The Trial Component name must be entirely lowercase.
    ///   - logger: Logger use during operation
    @inlinable
    public func batchPutMetrics(
        metricData: [RawMetricData]? = nil,
        trialComponentName: String? = nil,
        logger: Logger = AWSClient.loggingDisabled        
    ) async throws -> BatchPutMetricsResponse {
        let input = BatchPutMetricsRequest(
            metricData: metricData, 
            trialComponentName: trialComponentName
        )
        return try await self.batchPutMetrics(input, logger: logger)
    }
}

extension SageMakerMetrics {
    /// Initializer required by `AWSService.with(middlewares:timeout:byteBufferAllocator:options)`. You are not able to use this initializer directly as there are not public
    /// initializers for `AWSServiceConfig.Patch`. Please use `AWSService.with(middlewares:timeout:byteBufferAllocator:options)` instead.
    public init(from: SageMakerMetrics, patch: AWSServiceConfig.Patch) {
        self.client = from.client
        self.config = from.config.with(patch: patch)
    }
}
