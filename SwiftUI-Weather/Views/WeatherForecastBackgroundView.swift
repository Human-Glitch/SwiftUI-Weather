//
//  WeatherForecastBackgroundView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct WeatherForecastBackgroundView: View {
	@Binding var isNight: Bool
	
	var body: some View {
		LinearGradient(
			gradient: Gradient(
				colors: [
					isNight ? .black: .blue,
					isNight ? .gray : Color("lightBlue")
				]),
		    startPoint: .topLeading,
		    endPoint: .bottomTrailing)
				.edgesIgnoringSafeArea(.all) // fills up whole screen
	}
}

#Preview {
	Group{
		WeatherForecastBackgroundView(isNight: .constant(false))
		WeatherForecastBackgroundView(isNight: .constant(true))
	}
}
