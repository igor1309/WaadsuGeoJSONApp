//
//  GoogleMapsView.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import GoogleMaps
import SwiftUI

extension GMSCameraPosition  {
    static var moscow = GMSCameraPosition.camera(
        withLatitude: 55.7558,
        longitude: 37.6173,
        zoom: 10
    )
}

struct GoogleMapsView: UIViewRepresentable {
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.moscow
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
    }
}

struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView()
    }
}
