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
	
	var body: some View {
		HStack{
			Image(systemName: "magnifyingglass")
				.foregroundColor(.gray)
				.padding(.leading, 10)
			
			TextField("Search a zip code", text: $locationText,
					  onCommit: {
				isPresented = false
				
				if($locationText.wrappedValue.isEmpty){
					return
				}
				
				Task{
					foundLocation = await getLocationAsync(locationText: $locationText.wrappedValue);
					
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
	
	private func getLocationAsync(locationText: String) async -> Location{
		do{
			foundLocation = try await LocationService.GetLocationAsync(zip: locationText)
			return foundLocation
		}
		catch ServiceErrors.notFound {
			print("Not Found")
		}
		catch ServiceErrors.badRequest{
			print("Bad Request")
		}
		catch ServiceErrors.internalServerError{
			print("Internal Server Error")
		}
		catch {
			print("UknownError")
		}
		
		return Location()
	}
}

#Preview {
	SearchBarView(
		isPresented: .constant(false),
		foundLocation: .constant(Location()), locationText: .constant("")
	)
}
