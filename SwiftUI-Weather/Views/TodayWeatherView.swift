//
//  TodayWeatherView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct TodayWeatherView: View {
	@Binding var isNight: Bool
	var temperature: Int
	
	var body: some View {
		VStack(spacing: 10){
			Image(systemName: isNight ? "moon.stars.fill": "cloud.sun.fill")
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 180, height: 180)
			
			Text("\(temperature)°")
				.font(.system(size: 70, weight: .medium))
				.foregroundStyle(.white)
		}
		.padding(.bottom, 40)
	}
}

#Preview {
	Group{
		HStack{
			TodayWeatherView(isNight: .constant(false), temperature: 75)
				.background(.black)
			
			TodayWeatherView(isNight: .constant(true), temperature: 75)
				.background(.black)
		}
	}
}
