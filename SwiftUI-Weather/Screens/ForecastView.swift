//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct ForecastView: View {
	@Binding var location: Location
	@State private var isNight = false
	@State private var forecasts: [Weather] = []
	
    var body: some View {
		ZStack {
			WeatherForecastBackgroundView(isNight: $isNight)
			
			VStack{
				CityTextView(cityName: $location.Name.wrappedValue)
				
				if($forecasts.count != 0)
				{
					TodayView(isNight: $isNight, weather: $forecasts[0].wrappedValue)
					
					HStack(spacing: 10){
						ForEach($forecasts.wrappedValue[1...6], id: \.self){ weather in
							WeatherDailyView(weather: weather)
						}
					}
				}
			}
		}.onAppear {
			if($forecasts.count != 0){ return }
			
			Task{
				forecasts = try await getWeatherForecastAsync(
					latitude: $location.wrappedValue.Latitude,
					longitude: $location.wrappedValue.Longitude)
			}
		}
	}
	
	private func getWeatherForecastAsync(latitude: Double, longitude: Double) async throws -> [Weather]{
		
		do{
			forecasts = try await WeatherForecastService.getWeatherForecastAsync(latitude: $location.Latitude.wrappedValue, longitude: $location.Longitude.wrappedValue)
			
			let hour = Calendar.current.component(.hour, from: forecasts.first!.date)
			
			isNight = hour < 6 || hour >= 8
			return forecasts
		}
		catch ServiceErrors.notFound{
			print("Not Found")
		}
		catch ServiceErrors.badRequest{
			print("Bad Request")
		}
		catch ServiceErrors.internalServerError{
			print("Internal Server Error")
		}
		catch {
			print("UknownError")
		}
		
		return []
	}
}

#Preview {
	ForecastView(location: .constant(Location(name: "Little Rock, AR", latitude: 33.44, longitude: -94.04)))
}
