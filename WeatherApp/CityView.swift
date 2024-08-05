//
//  CityView.swift
//  WeatherApp
//
//  Created by Prashant on 03/08/24.
//

import SwiftUI


struct CityView: View {
    var cityArray: [String]
    @Binding var selectedCityIndex: Int
    var body: some View {
            ScrollView(.horizontal) {
                HStack(spacing: 20){
                    ForEach(cityArray, id: \.self) { city in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .blendMode(.softLight)
                            
                            Button {
                                selectedCityIndex = cityArray.firstIndex(of: city) ?? 0
                            } label: {
                                HStack {
                                    Image(systemName: cityArray[selectedCityIndex] == city ? "circle.fill" : "circle")
                                    Text(city)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 50, height: 100)
                }
                
            }
            .padding()
            
        }
        
            
    }
}
