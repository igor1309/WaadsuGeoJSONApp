//
//  AppViewModel.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import SwiftUI

final class AppViewModel: ObservableObject {
    @Published private(set) var appState: AppState
    
    enum AppState {
        case loading
        case error(String)
        case map(Data)
    }
    
    private let networkClient: NetworkClient
    
    /// Create `AppViewModel` injecting Network Client for testability.
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
        appState = .loading
    }
    
    /// Fetch remote data and change app state.
    @MainActor
    func fetch() async {
        do {
            appState = .loading
            let data = try await networkClient.fetch()
            withAnimation {
                appState = .map(data)
            }
        } catch {
            withAnimation {
                appState = .error(error.localizedDescription)
            }
        }
    }
}
