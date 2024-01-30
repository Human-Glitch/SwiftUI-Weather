//
//  WeatherForecastService.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import Foundation

//c&lon=-94.04
class WeatherForecastService {
	private static let baseUrl: String = "https://api.openweathermap.org/data/3.0/onecall"
	
	private static var forecast: [Weather] = []
	
	public static func getWeatherForecastAsync(latitude: Double, longitude: Double) -> [Weather] {
		forecast.removeAll()
		
		guard let url: URL = .init(string: "\(baseUrl)?lat=\(latitude)&lon=\(longitude)&exclude=minutely,hourly,alerts&appid=478ee3eaaa49afeee325cafcc62200d9&units=imperial")
		else{
			print("Failed to create a url with provided information.")
			return []
		}
		
		let task = URLSession.shared.dataTask(with: url) { data, response, error in
			if let data = data, let content = String(data: data, encoding: .utf8) {
				let decoder = JSONDecoder()
				do{
					let openWeatherResponse = try decoder.decode(OpenWeatherResponse.self, from: data)
					
					forecast.append(
						Weather(weekDay: "\(openWeatherResponse.current.dt)",
							   weatherIcon: getWeatherIcon(weatherDetail: openWeatherResponse.current.weather.first!),
							   temperature: Int(openWeatherResponse.current.temp)))
					
					for dailyWeather in openWeatherResponse.daily{
						forecast.append(
							Weather(weekDay: "\(dailyWeather.dt)",
								   weatherIcon: getWeatherIcon(weatherDetail: dailyWeather.weather.first!),
								   temperature: Int(dailyWeather.temp.day)))
					}
					
				}catch{
					print("Error decoding: \(error)")
				}
			}else if let error = error {
				// Handle networking error here
				print("Networking error: \(error)")
			}
		}
		
		task.resume()
		
		return forecast
	}
	
	private static func getWeatherIcon(weatherDetail: WeatherDetail) -> String {
		return "sun.max.fill"
	}
	
	
	
}
