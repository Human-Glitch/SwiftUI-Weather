//
//  Weather.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 1/28/24.
//

import Foundation
import SwiftUI

struct Weather : Hashable {
	var date: Date
	var weekDay: String
	var weatherIcon: String
	var temperature: Int
}
