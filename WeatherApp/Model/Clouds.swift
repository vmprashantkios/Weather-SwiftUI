//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Prashant on 02/08/24.
//

import Foundation
struct Clouds : Codable {
	let all : Int?

	enum CodingKeys: String, CodingKey {

		case all = "all"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		all = try values.decodeIfPresent(Int.self, forKey: .all)
	}

}
