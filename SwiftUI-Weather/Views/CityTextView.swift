//
//  CityTextView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import SwiftUI

struct CityTextView: View {
	var cityName : String
	
	var body: some View {
		Text(cityName)
			.font(.system(size: 32, weight: .medium, design: .default))
			.foregroundStyle(.white) // replaces foregroundColor(.white)
			.padding()
	}
}

#Preview {
	CityTextView(cityName: "Tulsa, OK")
		.background(.black)
}
