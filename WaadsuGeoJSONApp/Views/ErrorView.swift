//
//  ErrorView.swift
//  WaadsuGeoJSONApp
//
//  Created by Igor Malyarov on 01.11.2021.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let action: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Text("Error".uppercased())
                    .foregroundColor(.red)
                    .font(.caption)
                
                Text(message)
                    .padding(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button("Try again", action: action)
                    .buttonStyle(.borderedProminent)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Network is not available.") {}
    }
}
