//
//  AppDelegate.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import UIKit
import GoogleMaps

class AppDelegate: NSObject, UIApplicationDelegate    {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey(APIKey)
        return true
    }
}
