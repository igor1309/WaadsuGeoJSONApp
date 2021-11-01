//
//  NetworkClient.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import Foundation

struct NetworkClient {
    let fetch: () async throws -> Data
}

extension NetworkClient {
    static let live = Self {
        let url = URL(string: "https://waadsu.com/api/russia.geo.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
    static let waadsuShort = Self { .waadsuShort }
}
