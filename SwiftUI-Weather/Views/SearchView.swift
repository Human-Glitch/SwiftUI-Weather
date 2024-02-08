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
	
	let possibleLocations: [Location] = [
		Location(name: "Tulsa, OK", latitude: 36.1, longitude: -96.0),
		Location(name: "Little Rock, AR", latitude: 34.7, longitude: -92.6),
		Location(name: "Cupertino, CA", latitude: 37.32, longitude: -122.03)
	]

	var body: some View {
		NavigationStack{
			ZStack(alignment: .top){
				WeatherForecastBackgroundView(isNight: .constant(false))
				
				VStack{
					Image(systemName: "cloud.sun.fill")
						.renderingMode(.original)
						.resizable()
						.scaledToFit()
						.padding(30)
					
					Text("Weather")
						.foregroundStyle(.white)
						.font(.system(size: 58))
						.fontWeight(.bold)
						.frame(alignment: .center)
				}.frame(alignment: .leading)
				
				Spacer()
				
				VStack{
					List {}
					.scrollContentBackground(.hidden)
					.frame(maxHeight: 300, alignment: .top)
					.searchable(text: $locationText, prompt: "Search for a city"){
						ForEach(searchResults, id: \.self) { result in
							if (locationText.isEmpty == false){
								Text("\(result)").searchCompletion(result)
							}
						}
					}
					
					Spacer()
					
					Button("Search", action: {
						isPresented = false
						
						foundLocation = possibleLocations.first(where: { location in
							location.Name.uppercased().contains(locationText.uppercased())
						}) ?? Location()
						
						if(foundLocation.Name != "")
						{
							isPresented = true
							locationText = ""
						}
					})
					.padding()
					.font(.title3)
					.foregroundStyle(.white)
					.frame(width: 250, height: 50, alignment: .center)
					.background(.blue)
					.cornerRadius(10)
					
					Spacer()
				}
			}
			.navigationDestination(isPresented: .constant($isPresented.wrappedValue), destination: {
				ContentView(location: .constant(foundLocation))
			})
		}
	}
	
	var searchResults: [String] {
		if (locationText.isEmpty) {
			return possibleLocations.map{ $0.Name }
		}
			
		return possibleLocations
			.map{ $0.Name}
			.filter { name in
				name.uppercased().contains(locationText.uppercased())
			}
	}
}

#Preview {
	SearchView()
}
