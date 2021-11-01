//
//  GoogleMapsView.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import GoogleMaps
import GoogleMapsUtils
import SwiftUI

struct GoogleMapsView: UIViewRepresentable {
    
    private let geoJSON: Data
    private var lengthInKm: Binding<Int?>
    
    init(geoJSON: Data, lengthInKm: Binding<Int?>) {
        self.geoJSON = geoJSON
        self.lengthInKm = lengthInKm
    }
    
    func makeUIView(context: Context) -> GMSMapView {
        let mapView = GMSMapView()//frame: CGRect.zero, camera: camera)
        
        let geoJsonParser = GMUGeoJSONParser(data: geoJSON)
        geoJsonParser.parse()

        let renderer = GMUGeometryRenderer(
            map: mapView,
            geometries: geoJsonParser.features
        )
        renderer.render()
        
        // https://developers.google.com/maps/documentation/ios-sdk/views
        
        let paths: [GMSPath] = geoJsonParser.features.flatMap { container -> [GMSPath] in
            guard let collection = container.geometry as? GMUGeometryCollection
            else {
                print("not a polygon \(container.geometry)")
                return []
            }
            
            let paths = collection.geometries.flatMap { geometry  -> [GMSPath]in
                guard let polygon = geometry as? GMUPolygon
                else {
                    return []
                }
                
                return polygon.paths
            }
            
            return paths
        }
        
        let totalLength = paths.reduce(0) { partialResult, path in
            partialResult + path.length(of: .geodesic)
        }

        DispatchQueue.main.async {
            self.lengthInKm.wrappedValue = Int(
                totalLength.convert(from: .meters, to: .kilometers)
            )
        }
        
        let bounds: GMSCoordinateBounds = paths.reduce(.init()) { partialResult, path in
            GMSCoordinateBounds(path: path).includingBounds(partialResult)
        }
        
        let update = GMSCameraUpdate.fit(bounds, withPadding: 10.0)
        mapView.animate(with: update)
        
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
    }
}

struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView(geoJSON: .waadsuShort, lengthInKm: .constant(80))
    }
}
