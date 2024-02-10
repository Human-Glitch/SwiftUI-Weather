//
//  SearchView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/5/24.
//

import SwiftUI

struct SearchView: View {
	@State var isPresented: Bool = false
	@State var locationText: String = ""
	@State var foundLocation: Location = Location()
	
	var body: some View {
		NavigationStack{
			ZStack(alignment: .top){
				WeatherForecastBackgroundView(isNight: .constant(false))
				
				VStack{
					TitleView()
					
					SearchBarView(
						isPresented: $isPresented,
						foundLocation: $foundLocation,
						locationText: $locationText)
					
					Spacer()
				}
				.frame(alignment: .leading)
				.navigationDestination(isPresented: .constant($isPresented.wrappedValue), destination: {
					ForecastView(location: .constant(foundLocation))
				})
			}
		}
	}
}

#Preview {
	SearchView()
}
