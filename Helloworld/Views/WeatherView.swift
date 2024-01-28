//
//  WeatherView.swift
//  Helloworld
//
//  Created by Nam Lương Xuân on 28/01/2024.
//

import SwiftUI

struct WeatherView: View {
    var weather : ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack(spacing:20) {
                                Image(systemName: "sun.max")
                                    .font(.system(size: 40))
                                Text(weather.weather[0].main)
                            }
                            
                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDouble() + "*").font(.system(size: 100))
                                .fontWeight(.bold)
                                .padding()
                        }
                        Spacer().frame(height: 80)
                        
                        AsyncImage(url: URL(string:  "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) {
                            image in image.resizable().aspectRatio(contentMode: .fill).frame(width: 350)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Spacer()
                        
                    }.frame(maxWidth: .infinity)
                    
                    
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16.0)
                
                VStack{
                    Spacer()
                    
                    VStack(alignment: .leading,spacing: 20) {
                        Text("Weather Now ").bold().padding(.bottom)
                        HStack {
                            WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + " c"))
                            Spacer()
                            WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + " c"))
                        }
                        
                        HStack {
                            WeatherRow(logo: "wind", name: "Min Temp", value: (weather.wind.speed.roundDouble() + "c"))
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity) m/s")
                        }
                    }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .padding(.bottom,20)
                        .foregroundColor(Color(hue:0.656,saturation: 0.787,brightness: 0.354))
                        .background(.white)
                        .cornerRadius(20, corners: [.topLeft,.topRight])
                }
            }.padding(EdgeInsets())
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
        .background(Color(hue: 0.655, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

//#Preview {
////    WeatherView()
//}
