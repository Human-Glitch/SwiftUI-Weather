//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct ContentView: View {
	@State private var isNight = false
	
	private var forecast =
	[
		Weather(weekDay: WeekDay.mon.rawValue,
			   weatherIcon: WeatherIcon.sunMax.rawValue,
			   temperature: 74),
		Weather(weekDay: WeekDay.tue.rawValue,
			   weatherIcon: WeatherIcon.cloudSun.rawValue,
			   temperature: 74),
		Weather(weekDay: WeekDay.wed.rawValue,
			   weatherIcon: WeatherIcon.wind.rawValue,
			   temperature: 74),
		Weather(weekDay: WeekDay.thu.rawValue,
			   weatherIcon: WeatherIcon.cloudBolt.rawValue,
			   temperature: 74),
		Weather(weekDay: WeekDay.fri.rawValue,
			   weatherIcon: WeatherIcon.cloudRain.rawValue,
		       temperature: 74),
		Weather(weekDay: WeekDay.sat.rawValue,
			   weatherIcon: WeatherIcon.cloudSnow.rawValue,
			   temperature: 74),
		Weather(weekDay: WeekDay.sun.rawValue,
			   weatherIcon: WeatherIcon.snowflake.rawValue,
			   temperature: 74)
	]
	
	@State private var forecastByApi: [Weather] = []
	
    var body: some View {
		ZStack {
			WeatherForecastBackgroundView(isNight: $isNight)
			
			VStack{
				CityTextView(cityName: "Cupertino, CA")
				
				TodayWeatherView(isNight: $isNight, weather: forecast[0])
				
				HStack(spacing: 10){
					ForEach(forecast[1...], id: \.self){ weather in
						WeatherDayView(weather: weather)
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
		}
//		.onAppear{
//		   if(forecastByApi.count == 0){
//			   forecastByApi = WeatherForecastService.getWeatherForecastAsync(latitude: 33.44, longitude: -94.04)
//		   }
//	   }
    }
}

#Preview {
    ContentView()
}
