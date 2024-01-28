//
//  WelcomeView.swift
//  Helloworld
//
//  Created by Nam Lương Xuân on 26/01/2024.
//

import SwiftUI

import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the weather app")
                    .bold()
                    .font(.title)
                
                Text("Please share your current location to get the weather in your area")
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }.cornerRadius(30).symbolVariant(.fill)
                    .foregroundColor(.white)
            }
        }.multilineTextAlignment(.center).frame(maxWidth: .infinity,maxHeight: .infinity)
            .padding()

    }
}

#Preview {
    WelcomeView()
}
