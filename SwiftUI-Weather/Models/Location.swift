//
//  Location.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/6/24.
//

import Foundation

struct Location: Hashable{
	init(){
		Name = ""
		Latitude = 0
		Longitude = 0
	}
	
	init(name: String, latitude: Double, longitude: Double){
		Name = name
		Latitude = latitude
		Longitude = longitude
	}
	
	public var Name: String
	public var Latitude: Double
	public var Longitude: Double
}
