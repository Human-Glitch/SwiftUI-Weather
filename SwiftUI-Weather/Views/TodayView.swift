//
//  TodayWeatherView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct TodayView: View {
	@Binding var isNight: Bool
	var weather : Weather
	
	var body: some View {
		VStack(spacing: 5){
			Text("\(weather.weekDay)")
				.font(.system(size: 58, weight: .medium))
				.foregroundStyle(.white)
			
			Image(systemName: isNight ? "moon.stars.fill": "cloud.sun.fill")
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 180, height: 180)
			
			Text("\(weather.temperature)°")
				.font(.system(size: 70, weight: .medium))
				.foregroundStyle(.white)
		}
		.padding(10)
	}
}

#Preview {
	Group{
		HStack{
			TodayView(isNight: .constant(false), weather: Weather(date: Date(), weekDay: WeekDay.mon.rawValue, weatherIcon: WeatherIcon.cloudSun.rawValue, temperature: 75))
				.background(.black)
			
			TodayView(isNight: .constant(true), weather: Weather(date: Date(), weekDay: WeekDay.mon.rawValue, weatherIcon: WeatherIcon.cloudMoon.rawValue, temperature: 75))
				.background(.black)
		}
	}
}
