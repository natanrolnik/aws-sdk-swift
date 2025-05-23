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

/// Service object for interacting with AWS GeoPlaces service.
///
///  The Places API enables powerful location search and geocoding capabilities for your applications, offering global coverage with rich, detailed information. Key features include:    Forward and reverse geocoding for addresses and coordinates   Comprehensive place searches with detailed information, including:   Business names and addresses   Contact information   Hours of operation   POI (Points of Interest) categories   Food types for restaurants   Chain affiliation for relevant businesses     Global data coverage with a wide range of POI categories   Regular data updates to ensure accuracy and relevance
public struct GeoPlaces: AWSService {
    // MARK: Member variables

    /// Client used for communication with AWS
    public let client: AWSClient
    /// Service configuration
    public let config: AWSServiceConfig

    // MARK: Initialization

    /// Initialize the GeoPlaces client
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
            serviceName: "GeoPlaces",
            serviceIdentifier: "geo-places",
            serviceProtocol: .restjson,
            apiVersion: "2020-11-19",
            endpoint: endpoint,
            errorType: GeoPlacesErrorType.self,
            middleware: middleware,
            timeout: timeout,
            byteBufferAllocator: byteBufferAllocator,
            options: options
        )
    }





    // MARK: API Calls

    /// The autocomplete operation speeds up and increases the accuracy of entering addresses by providing a list of address candidates matching a partially entered address. Results are sorted from most to least matching. Filtering and biasing can be used to increase the relevance of the results if additional search context is known
    @Sendable
    @inlinable
    public func autocomplete(_ input: AutocompleteRequest, logger: Logger = AWSClient.loggingDisabled) async throws -> AutocompleteResponse {
        try await self.client.execute(
            operation: "Autocomplete", 
            path: "/autocomplete", 
            httpMethod: .POST, 
            serviceConfig: self.config, 
            input: input, 
            logger: logger
        )
    }
    /// The autocomplete operation speeds up and increases the accuracy of entering addresses by providing a list of address candidates matching a partially entered address. Results are sorted from most to least matching. Filtering and biasing can be used to increase the relevance of the results if additional search context is known
    ///
    /// Parameters:
    ///   - additionalFeatures: A list of optional additional parameters that can be requested for each result.
    ///   - biasPosition: The position in longitude and latitude that the results should be close to. Typically, place results returned are ranked higher the closer they are to this position. Stored in [lng, lat] and in the WSG84 format.  The fields BiasPosition, FilterBoundingBox, and FilterCircle are mutually exclusive.
    ///   - filter: A structure which contains a set of inclusion/exclusion properties that results must posses in order to be returned as a result.
    ///   - intendedUse: Indicates if the results will be stored. Defaults to SingleUse, if left empty.
    ///   - key: Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must be provided when making a request.
    ///   - language: A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for the result in the requested language, data will be returned in the default language for the entry.
    ///   - maxResults: An optional limit for the number of results returned in a single call.
    ///   - politicalView: The alpha-2 or alpha-3 character code for the political view of a country. The political view applies to the results of the request to represent unresolved territorial claims through the point of view of the specified country.
    ///   - postalCodeMode: The PostalCodeMode affects how postal code results are returned. If a postal code spans multiple localities and this value is empty,  partial district or locality information may be returned under a single postal code result entry. If it's populated with the value cityLookup, all cities in that postal code are returned.
    ///   - queryText: The free-form text query to match addresses against. This is usually a partially typed address from an end user in an address box or form.
    ///   - logger: Logger use during operation
    @inlinable
    public func autocomplete(
        additionalFeatures: [AutocompleteAdditionalFeature]? = nil,
        biasPosition: [Double]? = nil,
        filter: AutocompleteFilter? = nil,
        intendedUse: AutocompleteIntendedUse? = nil,
        key: String? = nil,
        language: String? = nil,
        maxResults: Int? = nil,
        politicalView: String? = nil,
        postalCodeMode: PostalCodeMode? = nil,
        queryText: String,
        logger: Logger = AWSClient.loggingDisabled        
    ) async throws -> AutocompleteResponse {
        let input = AutocompleteRequest(
            additionalFeatures: additionalFeatures, 
            biasPosition: biasPosition, 
            filter: filter, 
            intendedUse: intendedUse, 
            key: key, 
            language: language, 
            maxResults: maxResults, 
            politicalView: politicalView, 
            postalCodeMode: postalCodeMode, 
            queryText: queryText
        )
        return try await self.autocomplete(input, logger: logger)
    }

    /// The Geocode action allows you to obtain coordinates, addresses, and other information about places.
    @Sendable
    @inlinable
    public func geocode(_ input: GeocodeRequest, logger: Logger = AWSClient.loggingDisabled) async throws -> GeocodeResponse {
        try await self.client.execute(
            operation: "Geocode", 
            path: "/geocode", 
            httpMethod: .POST, 
            serviceConfig: self.config, 
            input: input, 
            logger: logger
        )
    }
    /// The Geocode action allows you to obtain coordinates, addresses, and other information about places.
    ///
    /// Parameters:
    ///   - additionalFeatures: A list of optional additional parameters, such as time zone, that can be requested for each result.
    ///   - biasPosition: The position, in longitude and latitude, that the results should be close to. Typically, place results returned are ranked higher the closer they are to this position. Stored in [lng, lat] and in the WSG84 format.  The fields BiasPosition, FilterBoundingBox, and FilterCircle are mutually exclusive.
    ///   - filter: A structure which contains a set of inclusion/exclusion properties that results must posses in order to be returned as a result.
    ///   - intendedUse: Indicates if the results will be stored. Defaults to SingleUse, if left empty.
    ///   - key: Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must be provided when making a request.
    ///   - language: A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for the result in the requested language, data will be returned in the default language for the entry.
    ///   - maxResults: An optional limit for the number of results returned in a single call.
    ///   - politicalView: The alpha-2 or alpha-3 character code for the political view of a country.  The political view applies to the results of the request to represent unresolved territorial claims through the point of view of the specified country.
    ///   - queryComponents: 
    ///   - queryText: The free-form text query to match addresses against. This is usually a partially typed address from an end user in an address box or form.
    ///   - logger: Logger use during operation
    @inlinable
    public func geocode(
        additionalFeatures: [GeocodeAdditionalFeature]? = nil,
        biasPosition: [Double]? = nil,
        filter: GeocodeFilter? = nil,
        intendedUse: GeocodeIntendedUse? = nil,
        key: String? = nil,
        language: String? = nil,
        maxResults: Int? = nil,
        politicalView: String? = nil,
        queryComponents: GeocodeQueryComponents? = nil,
        queryText: String? = nil,
        logger: Logger = AWSClient.loggingDisabled        
    ) async throws -> GeocodeResponse {
        let input = GeocodeRequest(
            additionalFeatures: additionalFeatures, 
            biasPosition: biasPosition, 
            filter: filter, 
            intendedUse: intendedUse, 
            key: key, 
            language: language, 
            maxResults: maxResults, 
            politicalView: politicalView, 
            queryComponents: queryComponents, 
            queryText: queryText
        )
        return try await self.geocode(input, logger: logger)
    }

    /// Finds a place by its unique ID. A PlaceId is returned by other place operations.
    @Sendable
    @inlinable
    public func getPlace(_ input: GetPlaceRequest, logger: Logger = AWSClient.loggingDisabled) async throws -> GetPlaceResponse {
        try await self.client.execute(
            operation: "GetPlace", 
            path: "/place/{PlaceId}", 
            httpMethod: .GET, 
            serviceConfig: self.config, 
            input: input, 
            logger: logger
        )
    }
    /// Finds a place by its unique ID. A PlaceId is returned by other place operations.
    ///
    /// Parameters:
    ///   - additionalFeatures: A list of optional additional parameters such as time zone that can be requested for each result.
    ///   - intendedUse: Indicates if the results will be stored. Defaults to SingleUse, if left empty.
    ///   - key: Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must be provided when making a request.
    ///   - language: A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for the result in the requested language, data will be returned in the default language for the entry.
    ///   - placeId: The PlaceId of the place you wish to receive the information for.
    ///   - politicalView: The alpha-2 or alpha-3 character code for the political view of a country. The political view applies to the results of the request to represent unresolved territorial claims through the point of view of the specified country.
    ///   - logger: Logger use during operation
    @inlinable
    public func getPlace(
        additionalFeatures: [GetPlaceAdditionalFeature]? = nil,
        intendedUse: GetPlaceIntendedUse? = nil,
        key: String? = nil,
        language: String? = nil,
        placeId: String,
        politicalView: String? = nil,
        logger: Logger = AWSClient.loggingDisabled        
    ) async throws -> GetPlaceResponse {
        let input = GetPlaceRequest(
            additionalFeatures: additionalFeatures, 
            intendedUse: intendedUse, 
            key: key, 
            language: language, 
            placeId: placeId, 
            politicalView: politicalView
        )
        return try await self.getPlace(input, logger: logger)
    }

    ///  The ReverseGeocode operation allows you to retrieve addresses and place information from coordinates.
    @Sendable
    @inlinable
    public func reverseGeocode(_ input: ReverseGeocodeRequest, logger: Logger = AWSClient.loggingDisabled) async throws -> ReverseGeocodeResponse {
        try await self.client.execute(
            operation: "ReverseGeocode", 
            path: "/reverse-geocode", 
            httpMethod: .POST, 
            serviceConfig: self.config, 
            input: input, 
            logger: logger
        )
    }
    ///  The ReverseGeocode operation allows you to retrieve addresses and place information from coordinates.
    ///
    /// Parameters:
    ///   - additionalFeatures: A list of optional additional parameters, such as time zone that can be requested for each result.
    ///   - filter: A structure which contains a set of inclusion/exclusion properties that results must posses in order to be returned as a result.
    ///   - intendedUse: Indicates if the results will be stored. Defaults to SingleUse, if left empty.
    ///   - key: Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must be provided when making a request.
    ///   - language: A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for the result in the requested language, data will be returned in the default language for the entry.
    ///   - maxResults: An optional limit for the number of results returned in a single call.
    ///   - politicalView: The alpha-2 or alpha-3 character code for the political view of a country. The political view applies to the results of the request to represent unresolved territorial claims through the point of view of the specified country.
    ///   - queryPosition: The position, in [lng, lat] for which you are querying nearby resultsfor. Results closer to the position will be ranked higher then results further away from the position
    ///   - queryRadius: The maximum distance in meters from the QueryPosition from which a result will be returned.
    ///   - logger: Logger use during operation
    @inlinable
    public func reverseGeocode(
        additionalFeatures: [ReverseGeocodeAdditionalFeature]? = nil,
        filter: ReverseGeocodeFilter? = nil,
        intendedUse: ReverseGeocodeIntendedUse? = nil,
        key: String? = nil,
        language: String? = nil,
        maxResults: Int? = nil,
        politicalView: String? = nil,
        queryPosition: [Double],
        queryRadius: Int64? = nil,
        logger: Logger = AWSClient.loggingDisabled        
    ) async throws -> ReverseGeocodeResponse {
        let input = ReverseGeocodeRequest(
            additionalFeatures: additionalFeatures, 
            filter: filter, 
            intendedUse: intendedUse, 
            key: key, 
            language: language, 
            maxResults: maxResults, 
            politicalView: politicalView, 
            queryPosition: queryPosition, 
            queryRadius: queryRadius
        )
        return try await self.reverseGeocode(input, logger: logger)
    }

    /// Search nearby a specified location.
    @Sendable
    @inlinable
    public func searchNearby(_ input: SearchNearbyRequest, logger: Logger = AWSClient.loggingDisabled) async throws -> SearchNearbyResponse {
        try await self.client.execute(
            operation: "SearchNearby", 
            path: "/search-nearby", 
            httpMethod: .POST, 
            serviceConfig: self.config, 
            input: input, 
            logger: logger
        )
    }
    /// Search nearby a specified location.
    ///
    /// Parameters:
    ///   - additionalFeatures: A list of optional additional parameters, such as time zone, that can be requested for each result.
    ///   - filter: A structure which contains a set of inclusion/exclusion properties that results must posses in order to be returned as a result.
    ///   - intendedUse: Indicates if the results will be stored. Defaults to SingleUse, if left empty.
    ///   - key: Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must be provided when making a request.
    ///   - language: A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for the result in the requested language, data will be returned in the default language for the entry.
    ///   - maxResults: An optional limit for the number of results returned in a single call.
    ///   - nextToken: If nextToken is returned,  there are more results available. The value of nextToken is a unique pagination token for each page.
    ///   - politicalView: The alpha-2 or alpha-3 character code for the political view of a country. The political view applies to the results of the request to represent unresolved territorial claims through the point of view of the specified country.
    ///   - queryPosition: The position, in [lng, lat] for which you are querying nearby resultsfor. Results closer to the position will be ranked higher then results further away from the position
    ///   - queryRadius: The maximum distance in meters from the QueryPosition from which a result will be returned.
    ///   - logger: Logger use during operation
    @inlinable
    public func searchNearby(
        additionalFeatures: [SearchNearbyAdditionalFeature]? = nil,
        filter: SearchNearbyFilter? = nil,
        intendedUse: SearchNearbyIntendedUse? = nil,
        key: String? = nil,
        language: String? = nil,
        maxResults: Int? = nil,
        nextToken: String? = nil,
        politicalView: String? = nil,
        queryPosition: [Double],
        queryRadius: Int64? = nil,
        logger: Logger = AWSClient.loggingDisabled        
    ) async throws -> SearchNearbyResponse {
        let input = SearchNearbyRequest(
            additionalFeatures: additionalFeatures, 
            filter: filter, 
            intendedUse: intendedUse, 
            key: key, 
            language: language, 
            maxResults: maxResults, 
            nextToken: nextToken, 
            politicalView: politicalView, 
            queryPosition: queryPosition, 
            queryRadius: queryRadius
        )
        return try await self.searchNearby(input, logger: logger)
    }

    /// Use the SearchText operation to search for geocode and place information. You can then complete a follow-up query suggested from the Suggest API via a query id.
    @Sendable
    @inlinable
    public func searchText(_ input: SearchTextRequest, logger: Logger = AWSClient.loggingDisabled) async throws -> SearchTextResponse {
        try await self.client.execute(
            operation: "SearchText", 
            path: "/search-text", 
            httpMethod: .POST, 
            serviceConfig: self.config, 
            input: input, 
            logger: logger
        )
    }
    /// Use the SearchText operation to search for geocode and place information. You can then complete a follow-up query suggested from the Suggest API via a query id.
    ///
    /// Parameters:
    ///   - additionalFeatures: A list of optional additional parameters, such as time zone, that can be requested for each result.
    ///   - biasPosition: The position, in longitude and latitude, that the results should be close to. Typically, place results returned are ranked higher the closer they are to this position. Stored in [lng, lat] and in the WSG84 format.  The fields BiasPosition, FilterBoundingBox, and FilterCircle are mutually exclusive.
    ///   - filter: A structure which contains a set of inclusion/exclusion properties that results must posses in order to be returned as a result.
    ///   - intendedUse: Indicates if the results will be stored. Defaults to SingleUse, if left empty.
    ///   - key: Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must be provided when making a request.
    ///   - language: A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for the result in the requested language, data will be returned in the default language for the entry.
    ///   - maxResults: An optional limit for the number of results returned in a single call.
    ///   - nextToken: If nextToken is returned,  there are more results available. The value of nextToken is a unique pagination token for each page.
    ///   - politicalView: The alpha-2 or alpha-3 character code for the political view of a country. The political view applies to the results of the request to represent unresolved territorial claims through the point of view of the specified country.
    ///   - queryId: The query Id.
    ///   - queryText: The free-form text query to match addresses against. This is usually a partially typed address from an end user in an address box or form.
    ///   - logger: Logger use during operation
    @inlinable
    public func searchText(
        additionalFeatures: [SearchTextAdditionalFeature]? = nil,
        biasPosition: [Double]? = nil,
        filter: SearchTextFilter? = nil,
        intendedUse: SearchTextIntendedUse? = nil,
        key: String? = nil,
        language: String? = nil,
        maxResults: Int? = nil,
        nextToken: String? = nil,
        politicalView: String? = nil,
        queryId: String? = nil,
        queryText: String? = nil,
        logger: Logger = AWSClient.loggingDisabled        
    ) async throws -> SearchTextResponse {
        let input = SearchTextRequest(
            additionalFeatures: additionalFeatures, 
            biasPosition: biasPosition, 
            filter: filter, 
            intendedUse: intendedUse, 
            key: key, 
            language: language, 
            maxResults: maxResults, 
            nextToken: nextToken, 
            politicalView: politicalView, 
            queryId: queryId, 
            queryText: queryText
        )
        return try await self.searchText(input, logger: logger)
    }

    /// The Suggest operation finds addresses or place candidates based on incomplete or misspelled queries. You then select the best query to submit based on the returned results.
    @Sendable
    @inlinable
    public func suggest(_ input: SuggestRequest, logger: Logger = AWSClient.loggingDisabled) async throws -> SuggestResponse {
        try await self.client.execute(
            operation: "Suggest", 
            path: "/suggest", 
            httpMethod: .POST, 
            serviceConfig: self.config, 
            input: input, 
            logger: logger
        )
    }
    /// The Suggest operation finds addresses or place candidates based on incomplete or misspelled queries. You then select the best query to submit based on the returned results.
    ///
    /// Parameters:
    ///   - additionalFeatures: A list of optional additional parameters, such as time zone, that can be requested for each result.
    ///   - biasPosition: The position, in longitude and latitude, that the results should be close to. Typically, place results returned are ranked higher the closer they are to this position. Stored in [lng, lat] and in the WSG84 format.  The fields BiasPosition, FilterBoundingBox, and FilterCircle are mutually exclusive.
    ///   - filter: A structure which contains a set of inclusion/exclusion properties that results must posses in order to be returned as a result.
    ///   - intendedUse: Indicates if the results will be stored. Defaults to SingleUse, if left empty.
    ///   - key: Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must be provided when making a request.
    ///   - language: A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for the result in the requested language, data will be returned in the default language for the entry.
    ///   - maxQueryRefinements: Maximum number of query terms to be returned for use with a search text query.
    ///   - maxResults: An optional limit for the number of results returned in a single call.
    ///   - politicalView: The alpha-2 or alpha-3 character code for the political view of a country. The political view applies to the results of the request to represent unresolved territorial claims through the point of view of the specified country.
    ///   - queryText: The free-form text query to match addresses against. This is usually a partially typed address from an end user in an address box or form.
    ///   - logger: Logger use during operation
    @inlinable
    public func suggest(
        additionalFeatures: [SuggestAdditionalFeature]? = nil,
        biasPosition: [Double]? = nil,
        filter: SuggestFilter? = nil,
        intendedUse: SuggestIntendedUse? = nil,
        key: String? = nil,
        language: String? = nil,
        maxQueryRefinements: Int? = nil,
        maxResults: Int? = nil,
        politicalView: String? = nil,
        queryText: String,
        logger: Logger = AWSClient.loggingDisabled        
    ) async throws -> SuggestResponse {
        let input = SuggestRequest(
            additionalFeatures: additionalFeatures, 
            biasPosition: biasPosition, 
            filter: filter, 
            intendedUse: intendedUse, 
            key: key, 
            language: language, 
            maxQueryRefinements: maxQueryRefinements, 
            maxResults: maxResults, 
            politicalView: politicalView, 
            queryText: queryText
        )
        return try await self.suggest(input, logger: logger)
    }
}

extension GeoPlaces {
    /// Initializer required by `AWSService.with(middlewares:timeout:byteBufferAllocator:options)`. You are not able to use this initializer directly as there are not public
    /// initializers for `AWSServiceConfig.Patch`. Please use `AWSService.with(middlewares:timeout:byteBufferAllocator:options)` instead.
    public init(from: GeoPlaces, patch: AWSServiceConfig.Patch) {
        self.client = from.client
        self.config = from.config.with(patch: patch)
    }
}
