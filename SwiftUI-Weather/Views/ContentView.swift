//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct ContentView: View {
	@State private var isNight = false
	
    var body: some View {
		ZStack {
			WeatherForecastBackgroundView(isNight: $isNight) // fills up whole screen
			
			VStack{
				CityTextView(cityName: "Cupertino, CA")
				
				TodayWeatherView(isNight: $isNight, temperature: 76)
				
				HStack(spacing: 20){
					WeatherDayView(dayOfWeek: "TUE",
								  imageName: "cloud.sun.fill",
								  temperature: 74)
					
					WeatherDayView(dayOfWeek: "WED",
								  imageName: "sun.max.fill",
								  temperature: 88)
					
					WeatherDayView(dayOfWeek: "THU",
								  imageName: "wind.snow",
								  temperature: 55)
					
					WeatherDayView(dayOfWeek: "FRI",
								  imageName: "cloud.rain.fill",
								  temperature: 60)
					
					WeatherDayView(dayOfWeek: "SAT",
								  imageName: "snow",
								  temperature: 25)
				}
				
				Spacer()
				
				Button(action: {
					isNight.toggle()
				}, label: {
					WeatherButton(title: "Change Day Time",
								 backgroundColor: .white,
								 foregroundColor: .blue)
				})
				
				Spacer()
			}
		}
    }
}

#Preview {
    ContentView()
}
