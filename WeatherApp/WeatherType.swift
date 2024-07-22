//
//  WeatherType.swift
//  WeatherApp
//
//  Created by Artem Martirosyan on 21.07.2024.
//

import Foundation

enum WeatherType: String, CaseIterable {
    case sun, rainSun, snowSun, rain, heavyRain, wind, thunderstorm, fog, snow, cloud, tornado
    
    var rawValue: String {
        switch self {
        case .sun:
            return String(localized: "Sun")
        case .rainSun:
            return String(localized: "Rainy sun")
        case .snowSun:
            return String(localized: "Snowy sun")
        case .rain:
            return String(localized: "Rain")
        case .heavyRain:
            return String(localized: "Heavy rain")
        case .wind:
            return String(localized: "Wind")
        case .thunderstorm:
            return String(localized: "Thunderstorm")
        case .fog:
            return String(localized: "Fog")
        case .snow:
            return String(localized: "Snow")
        case .cloud:
            return String(localized: "Cloud")
        case .tornado:
            return String(localized: "Tornado")
        }
    }
    
    var symbol: String {
        switch self {
        case .sun:
            return "sun.max.fill"
        case .rainSun:
            return "sun.rain.fill"
        case .snowSun:
            return "sun.snow.fill"
        case .rain:
            return "cloud.rain.fill"
        case .heavyRain:
            return "cloud.heavyrain.fill"
        case .wind:
            return "wind"
        case .thunderstorm:
            return "cloud.bolt.rain.fill"
        case .fog:
            return "cloud.fog.fill"
        case .snow:
            return "cloud.snow.fill"
        case .cloud:
            return "cloud.fill"
        case .tornado:
            return "tornado"
        }
    }
}
