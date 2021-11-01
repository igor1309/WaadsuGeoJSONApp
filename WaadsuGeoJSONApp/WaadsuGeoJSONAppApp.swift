//
//  WaadsuGeoJSONAppApp.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import SwiftUI

let APIKey = "AIzaSyCY2s_e9wItai4_kHqbGtp7YOsy1GWO4fo"

@main
struct WaadsuGeoJSONAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
