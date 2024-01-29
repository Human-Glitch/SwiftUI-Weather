//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct WeatherButton: View {
	var title: String
	var backgroundColor: Color
	var foregroundColor: Color
	
	var body: some View {
		Text(title)
			.frame(width: 280, height: 50)
			.background(backgroundColor)
			.foregroundStyle(foregroundColor)
			.font(.system(size: 20, weight: .bold, design: .default))
			.clipShape(.buttonBorder)  // replaces .cornerRadius(10.0)
	}
}

#Preview {
	WeatherButton(title: "Test", backgroundColor: .blue, foregroundColor: .white)
}
