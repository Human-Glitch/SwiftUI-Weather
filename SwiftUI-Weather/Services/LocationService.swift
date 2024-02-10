//
//  ZipCodeService.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/9/24.
//

import Foundation

class LocationService{
	private static let baseUrl = "https://api.zipcodestack.com/v1/search"
	
	public static func GetLocationAsync(zip: String) async throws -> Location{
		
		// Define Url
		guard let url: URL = URL(string: "\(baseUrl)?codes=\(zip)&country=us&apikey=01HP82NR811K6A84VJDNCZMMBQ")
		else{
			throw ServiceErrors.invalidUrl
		}
		
		// Make call
		let (data, response) = try await URLSession.shared.data(from: url)
		
		//let content = String(data: data, encoding: .utf8)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200
		else{
			let httpResponse = response as? HTTPURLResponse
			throw ServiceErrorUtilities.ThrowException(statusCode: httpResponse?.statusCode)
		}
		
		// Deserialize
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		guard let zipCodeStackResponse = try? decoder.decode(ZipCodeStackResponse.self, from: data)
		else{
			throw ServiceErrors.deserializationFailed
		}
		
		// Map response
		let name = "\(zipCodeStackResponse.results.values.first!.first!.city), \(zipCodeStackResponse.results.values.first!.first!.stateCode)"
		
		let latitude = zipCodeStackResponse.results.values.first!.first!.latitude
		let longitude = zipCodeStackResponse.results.values.first!.first!.latitude
		
		return Location(
			name: "\(name)",
			latitude: latitude,
			longitude: longitude)
	}
}
