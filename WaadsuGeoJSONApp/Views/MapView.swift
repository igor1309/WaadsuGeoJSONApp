//
//  MapView.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import SwiftUI

struct MapView: View {
    let data: Data
    
    @State private var lengthInKm: Int?
    
    var body: some View {
        // parse and draw GeoJSON data and calculate length
        GoogleMapsView(geoJSON: data, lengthInKm: $lengthInKm)
            .ignoresSafeArea(.all)
            .overlay(alignment: .topLeading, content: legend)
    }
    
    @ViewBuilder
    private func legend() -> some View {
        lengthInKm.map { lengthInKm in
            Text("Selected area perimeter is \(lengthInKm) km")
                .font(.footnote.weight(.heavy))
                .padding(.vertical, 6)
                .padding(.horizontal)
                .background(.thinMaterial)
                .clipShape(Capsule())
                .padding()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(data: .waadsuShort)
    }
}
