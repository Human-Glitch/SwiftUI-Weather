//
//  WeatherDayView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct WeatherDayView: View {
	var dayOfWeek : String
	var imageName : String
	var temperature : Int
	
	var body: some View {
		VStack{
			Text(dayOfWeek)
				.font(.system(size: 16 , weight: .medium, design: .default))
				.foregroundStyle(.white)
			
			Image(systemName: imageName)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 50, height: 50)
			
			Text("\(temperature)°")
				.font(.system(size: 24, weight: .medium, design: .default))
				.foregroundStyle(.white)
		}
	}
}

#Preview {
	Group{
		HStack{
			WeatherDayView(dayOfWeek: "MON", imageName: "sun.max.fill", temperature: 75)
				.background(.blue)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 75)
				.background(.blue)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "cloud.bolt.fill", temperature: 75)
				.background(.blue)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "cloud.rain.fill", temperature: 75)
				.background(.blue)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "cloud.hail.fill", temperature: 75)
				.background(.blue)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "cloud.snow.fill", temperature: 75)
				.background(.blue)
		}
		
		HStack{
			WeatherDayView(dayOfWeek: "MON", imageName: "wind", temperature: 75)
				.background(.orange)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "snowflake", temperature: 75)
				.background(.orange)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "tornado", temperature: 75)
				.background(.orange)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "tropicalstorm", temperature: 75)
				.background(.orange)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "hurricane", temperature: 75)
				.background(.orange)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "rainbow", temperature: 75)
				.background(.orange)
		}
		
		HStack{
			WeatherDayView(dayOfWeek: "MON", imageName: "moon.fill", temperature: 75)
				.background(.black)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "moon.stars.fill", temperature: 75)
				.background(.black)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "cloud.moon.rain.fill", temperature: 75)
				.background(.black)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "cloud.moon.rain.fill", temperature: 75)
				.background(.black)
			
			WeatherDayView(dayOfWeek: "MON", imageName: "cloud.moon.bolt.fill", temperature: 75)
				.background(.black)
		}
	}
	
}
