//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Prashant on 02/08/24.
//

import Foundation
struct Coord : Codable, Equatable {
	let lon : Double?
	let lat : Double?

	enum CodingKeys: String, CodingKey {

		case lon = "lon"
		case lat = "lat"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lon = try values.decodeIfPresent(Double.self, forKey: .lon)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
	}

}
