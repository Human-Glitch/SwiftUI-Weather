//
//  ZipCodeStackResponse.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/9/24.
//

import Foundation

struct ZipCodeStackResponse : Decodable{
	let results: [String: [Result]]
}

struct Result: Decodable {
	let latitude: Double
	let longitude: Double
	let city: String
	let stateCode: String
}
