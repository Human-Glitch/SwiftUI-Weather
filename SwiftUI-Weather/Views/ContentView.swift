//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct ContentView: View {
	@State private var isNight = false
	@State private var forecastByApi: [Weather] = []
	
    var body: some View {
		ZStack {
			WeatherForecastBackgroundView(isNight: $isNight)
			
			VStack{
				CityTextView(cityName: "Cupertino, CA")
				
				if($forecastByApi.count != 0)
				{
					TodayWeatherView(isNight: $isNight, weather: $forecastByApi[0].wrappedValue)
					
					HStack(spacing: 10){
						ForEach($forecastByApi.wrappedValue[1...6], id: \.self){ weather in
							WeatherDayView(weather: weather)
						}
					}
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
		}.task{
			if($forecastByApi.count != 0){ return }
			do{
				
				forecastByApi = try await WeatherForecastService.getWeatherForecastAsync(latitude: 33.44, longitude: -94.04)
			}
			catch OpenWeatherErrors.notFound {
				print("Not Found")
			}
			catch OpenWeatherErrors.badRequest{
				print("Bad Request")
			}
			catch OpenWeatherErrors.internalServerError{
				print("Internal Server Error")
			}
			catch {
				print("UknownError")
			}
		}
	}
}

#Preview {
    ContentView()
}
