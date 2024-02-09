//
//  SearchBarView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/8/24.
//

import SwiftUI

struct SearchBarView: View {
	@Binding var isPresented: Bool
	@Binding var foundLocation: Location
	@Binding var locationText: String
	
	let possibleLocations: [Location] = [
		Location(name: "Tulsa, OK", latitude: 36.1, longitude: -96.0),
		Location(name: "Little Rock, AR", latitude: 34.7, longitude: -92.6),
		Location(name: "Cupertino, CA", latitude: 37.32, longitude: -122.03)
	]
	
	var body: some View {
		HStack{
			Image(systemName: "magnifyingglass")
				.foregroundColor(.gray)
				.padding(.leading, 10)
			
			TextField("Search for a city", text: $locationText, onCommit: {

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
			.frame(width: 300)
			.padding(10)
		}
		.background(Color.white) // Set the background color here
		.cornerRadius(8)
	}
}

#Preview {
	SearchBarView(
		isPresented: .constant(false),
		foundLocation: .constant(Location()), locationText: .constant("")
	)
}
