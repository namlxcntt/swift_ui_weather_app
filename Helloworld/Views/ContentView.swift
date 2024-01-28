//
//  ContentView.swift
//  Helloworld
//
//  Created by Nam Lương Xuân on 24/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager().self
    
    @State var weather : ResponseBody?
    
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    Text("Your coordinates are: \(location.longitude),\(location.latitude)")
                    LoadingView().task {
                        do {
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                        } catch {
                            print("Error getting weather")
                        }
                    }
                }
                
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(
            Color(hue: 0.655, saturation: 0.787, brightness: 0.354)
        )
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
