//
//  OpenWeatherUtilities.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/4/24.
//

import Foundation

struct OpenWeatherUtilities{
	public static func getDayOfWeek(date: Date) -> String {
		let dayOfWeek = Calendar.current.component(.weekday, from: date)

		return switch dayOfWeek {
			case 1: WeekDay.sun.rawValue
			case 2: WeekDay.mon.rawValue
			case 3: WeekDay.tue.rawValue
			case 4: WeekDay.wed.rawValue
			case 5: WeekDay.thu.rawValue
			case 6: WeekDay.fri.rawValue
			case 7: WeekDay.sat.rawValue
			default: "Invalid day"
		}
	}
	
	public static func getDate(dateTimeEpoch: Int, timeZoneEpoch: Int) -> Date {
		let timeInterval = TimeInterval(dateTimeEpoch + timeZoneEpoch)
		return Date(timeIntervalSince1970: timeInterval)
	}
}
