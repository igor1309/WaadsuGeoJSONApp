//
//  ContentView.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: AppViewModel
    
    var body: some View {
        Group {
            // switch on app state to present the corresponding view
            switch viewModel.appState {
                
            case .loading:
                LoadingView()
                
            case .error(let message):
                ErrorView(message: message) {
                    Task {
                        await viewModel.fetch()
                    }
                }
                
            case .map(let data):
                MapView(data: data)
            }
        }
        .task { await viewModel.fetch() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            viewModel: .init(
                networkClient: .init(
                    fetch: { .waadsuShort }
                )
            )
        )
    }
}
