//
//  WeatherDayView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct WeatherDayView: View {
	var weather : Weather
	
	var body: some View {
		VStack{
			Text(weather.weekDay)
				.font(.system(size: 16 , weight: .medium, design: .default))
				.foregroundStyle(.white)
			
			Image(systemName: weather.weatherIcon)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 50, height: 50)
			
			Text("\(weather.temperature)°")
				.font(.system(size: 24, weight: .medium, design: .default))
				.foregroundStyle(.white)
		}
	}
}

#Preview {
	Group{
		HStack{
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "sun.max.fill", temperature: 75))
				.background(.blue)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "cloud.sun.fill", temperature: 75))
				.background(.blue)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "cloud.bolt.fill", temperature: 75))
				.background(.blue)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "cloud.rain.fill", temperature: 75))
				.background(.blue)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "cloud.hail.fill", temperature: 75))
				.background(.blue)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "cloud.snow.fill", temperature: 75))
				.background(.blue)
		}
		
		HStack{
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "wind", temperature: 75))
				.background(.orange)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "snowflake", temperature: 75))
				.background(.orange)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "tornado", temperature: 75))
				.background(.orange)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "tropicalstorm", temperature: 75))
				.background(.orange)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "hurricane", temperature: 75))
				.background(.orange)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "rainbow", temperature: 75))
				.background(.orange)
		}
		
		HStack{
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "moon.fill", temperature: 75))
				.background(.black)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "moon.stars.fill", temperature: 75))
				.background(.black)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "cloud.moon.rain.fill", temperature: 75))
				.background(.black)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "cloud.moon.rain.fill", temperature: 75))
				.background(.black)
			
			WeatherDayView(weather: Weather(date: Date(), weekDay: "MON", weatherIcon: "cloud.moon.bolt.fill", temperature: 75))
				.background(.black)
		}
	}
	
}
