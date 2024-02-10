//
//  OpenWeatherErrors.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/4/24.
//

import Foundation

public enum ServiceErrors : Error {
	case invalidUrl
	case notFound
	case badRequest
	case internalServerError
	case deserializationFailed
	case otherFailure
}

struct ServiceErrorUtilities{
	public static func ThrowException(statusCode: Int?) -> ServiceErrors {
		switch statusCode {
			case 400:
				return ServiceErrors.badRequest
			case 404:
				return ServiceErrors.notFound
			case 500:
				return ServiceErrors.internalServerError
			default:
				return ServiceErrors.otherFailure
		}
	}
}
