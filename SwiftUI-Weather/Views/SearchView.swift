//
//  SearchView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/5/24.
//

import SwiftUI

struct SearchView: View {
	@State var locationText: String = ""
	let possibleLocations: [(name: String, longitude: Double, latitude: Double)] = [
		(name: "Tulsa, OK", longitude: 200.0, latitude: 100.0 ),
		(name: "Little Rock, AR", longitude: 200.0, latitude: 100.0),
		(name: "Cupertino, CA", longitude: 200.0, latitude: 100.0)
	]

	var body: some View {
		ZStack{
			WeatherForecastBackgroundView(isNight: .constant(false))
			VStack{
				HStack{
					Image(systemName: "cloud.sun.fill")
						.renderingMode(.original)
						.resizable()
						.scaledToFit()
					
					Text("Weather")
						.foregroundStyle(.white)
						.font(.system(.largeTitle))
						.fontWeight(.bold)
						.frame(alignment: .center)
				}
				.frame(height:50)
				.padding()
				
				NavigationStack {
					List {}
				}
				
				.searchable(text: $locationText, prompt: "Search for a city"){
					ForEach(searchResults, id: \.self) { result in
					   Text("\(result)").searchCompletion(result)
				   }
				}
				
				Spacer()
			}
		}
	}
	
	var searchResults: [String] {
		if locationText.isEmpty {
			return possibleLocations.map{ $0.name }
		}
			
		return possibleLocations
			.map{ $0.name}
			.filter { name in
				name.uppercased().contains(locationText.uppercased())
			}
	}
}

#Preview {
	SearchView()
}
