//
//  WeatherForecastService.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import Foundation

class WeatherForecastService {
	private static let baseUrl: String = "https://api.openweathermap.org/data/3.0/onecall"
	
	public static func getWeatherForecastAsync(latitude: Double, longitude: Double) async throws -> [Weather] {
		
		// Define Url
		guard let url: URL = URL(string: "\(baseUrl)?lat=\(latitude)&lon=\(longitude)&exclude=minutely,hourly,alerts&appid=478ee3eaaa49afeee325cafcc62200d9&units=imperial")
		else{
			throw OpenWeatherErrors.invalidUrl
		}
		
		// Make call
		let (data, response) = try await URLSession.shared.data(from: url)
		
		//let content = String(data: data, encoding: .utf8)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200
		else{
			let httpResponse = response as? HTTPURLResponse
			throw throwException(statusCode: httpResponse?.statusCode)
		}
		
		// Deserialize
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		guard let openWeatherResponse = try? decoder.decode(OpenWeatherResponse.self, from: data)
		else{
			throw OpenWeatherErrors.deserializationFailed
		}
		
		// Map response
		var forecast : [Weather] = []
		
		let timezoneEpoch = openWeatherResponse.timezoneOffset
		
		let currentWeather = openWeatherResponse.current
		let currentDate = OpenWeatherUtilities.getDate(dateTimeEpoch: currentWeather.dt, timeZoneEpoch: timezoneEpoch)
		let currentWeekDay = OpenWeatherUtilities.getDayOfWeek(date: currentDate)
		
		forecast.append(
			Weather(
				weekDay: "\(currentWeekDay)",
				weatherIcon: getWeatherIcon(weatherDetail: currentWeather.weather.first!),
				temperature: Int(currentWeather.temp)
			)
		)
		
		for dailyWeather in openWeatherResponse.daily[1...]{
			let date = OpenWeatherUtilities.getDate(dateTimeEpoch: dailyWeather.dt, timeZoneEpoch: timezoneEpoch)
			let weekDay = OpenWeatherUtilities.getDayOfWeek(date: date)
			
			forecast.append(
				Weather(
					weekDay: "\(weekDay)",
					weatherIcon: getWeatherIcon(weatherDetail: dailyWeather.weather.first!),
					temperature: Int(dailyWeather.temp.day)
				)
			)
		}
		
		return forecast
	}
	
	private static func getWeatherIcon(weatherDetail: WeatherDetail) -> String {
		
		return switch weatherDetail.main{
			case("Clouds"): WeatherIcon.cloudSun.rawValue
			case("Rain"): WeatherIcon.cloudRain.rawValue
			case("Snow"): WeatherIcon.snowflake.rawValue
			default: WeatherIcon.sunMax.rawValue
		}
	}
	
	private static func throwException(statusCode: Int?) -> OpenWeatherErrors {
		switch statusCode {
			case 400:
				return OpenWeatherErrors.badRequest
			case 404:
				return OpenWeatherErrors.notFound
			case 500:
				return OpenWeatherErrors.internalServerError
			default:
				return OpenWeatherErrors.otherFailure
		}
	}
}
