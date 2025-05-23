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
@_spi(SotoInternal) import SotoCore

extension MarketplaceReporting {
    // MARK: Enums

    // MARK: Shapes

    public struct GetBuyerDashboardInput: AWSEncodableShape {
        /// The ARN of the requested dashboard.
        public let dashboardIdentifier: String
        /// Fully qualified domains that you add to the allow list for access to the generated URL that is then embedded. You can list up to two domains or subdomains in each API call. To include all subdomains under a specific domain, use *. For example, https://*.amazon.com includes all subdomains under  https://aws.amazon.com.
        public let embeddingDomains: [String]

        @inlinable
        public init(dashboardIdentifier: String, embeddingDomains: [String]) {
            self.dashboardIdentifier = dashboardIdentifier
            self.embeddingDomains = embeddingDomains
        }

        public func validate(name: String) throws {
            try self.validate(self.dashboardIdentifier, name: "dashboardIdentifier", parent: name, max: 1023)
            try self.validate(self.dashboardIdentifier, name: "dashboardIdentifier", parent: name, min: 1)
            try self.validate(self.dashboardIdentifier, name: "dashboardIdentifier", parent: name, pattern: "^arn:aws:aws-marketplace::[0-9]{12}:AWSMarketplace/ReportingData/(Agreement_V1/Dashboard/AgreementSummary_V1|BillingEvent_V1/Dashboard/CostAnalysis_V1)$")
            try self.embeddingDomains.forEach {
                try validate($0, name: "embeddingDomains[]", parent: name, max: 2000)
                try validate($0, name: "embeddingDomains[]", parent: name, min: 1)
                try validate($0, name: "embeddingDomains[]", parent: name, pattern: "^(https://[a-zA-Z\\.\\*0-9\\-_]+[\\.]{1}[a-zA-Z]{1,}[a-zA-Z0-9&?/-_=]*[a-zA-Z\\*0-9/]+|http[s]*://localhost(:[0-9]{1,5})?)$")
            }
            try self.validate(self.embeddingDomains, name: "embeddingDomains", parent: name, max: 2)
            try self.validate(self.embeddingDomains, name: "embeddingDomains", parent: name, min: 1)
        }

        private enum CodingKeys: String, CodingKey {
            case dashboardIdentifier = "dashboardIdentifier"
            case embeddingDomains = "embeddingDomains"
        }
    }

    public struct GetBuyerDashboardOutput: AWSDecodableShape {
        /// The ARN of the returned dashboard.
        public let dashboardIdentifier: String
        /// The fully qualified domains specified in the request. The domains enable access to the generated URL that is then embedded. You can list up to two domains or subdomains in each API call. To include all subdomains under a specific domain, use *. For example, https://*.amazon.com includes all subdomains under  https://aws.amazon.com.
        public let embeddingDomains: [String]
        /// The dashboard's embedding URL.
        public let embedUrl: String

        @inlinable
        public init(dashboardIdentifier: String, embeddingDomains: [String], embedUrl: String) {
            self.dashboardIdentifier = dashboardIdentifier
            self.embeddingDomains = embeddingDomains
            self.embedUrl = embedUrl
        }

        private enum CodingKeys: String, CodingKey {
            case dashboardIdentifier = "dashboardIdentifier"
            case embeddingDomains = "embeddingDomains"
            case embedUrl = "embedUrl"
        }
    }
}

// MARK: - Errors

/// Error enum for MarketplaceReporting
public struct MarketplaceReportingErrorType: AWSErrorType {
    enum Code: String {
        case accessDeniedException = "AccessDeniedException"
        case badRequestException = "BadRequestException"
        case internalServerException = "InternalServerException"
        case unauthorizedException = "UnauthorizedException"
    }

    private let error: Code
    public let context: AWSErrorContext?

    /// initialize MarketplaceReporting
    public init?(errorCode: String, context: AWSErrorContext) {
        guard let error = Code(rawValue: errorCode) else { return nil }
        self.error = error
        self.context = context
    }

    internal init(_ error: Code) {
        self.error = error
        self.context = nil
    }

    /// return error code string
    public var errorCode: String { self.error.rawValue }

    /// You do not have sufficient access to perform this action.
    public static var accessDeniedException: Self { .init(.accessDeniedException) }
    /// The request is malformed, or it contains an error such as an invalid parameter. Ensure the request has all required parameters.
    public static var badRequestException: Self { .init(.badRequestException) }
    /// The operation failed due to a server error.
    public static var internalServerException: Self { .init(.internalServerException) }
    /// You do not have permission to perform this action.
    public static var unauthorizedException: Self { .init(.unauthorizedException) }
}

extension MarketplaceReportingErrorType: Equatable {
    public static func == (lhs: MarketplaceReportingErrorType, rhs: MarketplaceReportingErrorType) -> Bool {
        lhs.error == rhs.error
    }
}

extension MarketplaceReportingErrorType: CustomStringConvertible {
    public var description: String {
        return "\(self.error.rawValue): \(self.message ?? "")"
    }
}
