//
//  Extensions.swift
//  WeatherApp
//
//  Created by Prashant on 03/08/24.
//

import Foundation

extension Double {
    func getTempratureWithDegreeSymbol() -> String {
        let numFormatter = NumberFormatter()
        numFormatter.allowsFloats = false
        let measureFormatter = MeasurementFormatter()
        measureFormatter.numberFormatter = numFormatter
        let measurement = Measurement(value: self, unit: UnitTemperature.celsius)
        return measureFormatter.string(from: measurement)
    }
}
