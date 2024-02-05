//
//  OpenWeatherErrors.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/4/24.
//

import Foundation

public enum OpenWeatherErrors : Error {
	case invalidUrl
	case notFound
	case badRequest
	case internalServerError
	case deserializationFailed
	case otherFailure
}
