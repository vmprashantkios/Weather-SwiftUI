//
//  SunCardView.swift
//  WeatherApp
//
//  Created by Prashant on 03/08/24.
//

import SwiftUI


struct SunCard: View {
    var icon: String
    var title: String
    var riseTime: String
    var setTime: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .blendMode(.softLight)
            VStack() {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: icon)
                            .foregroundColor(.white)
                            .font(.callout)
                        Text(title)
                            .foregroundStyle(.white)
                            .font(.callout)
                        Spacer()
                    }
                    Text(riseTime)
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.medium)
                }
                .padding()
                Spacer()
                Rectangle()
                    .frame(height: 2)
                    .overlay(.white)
                HStack {
                    Text("Sunset")
                        .foregroundStyle(.white)
                        .font(.callout)
                    Text(setTime)
                        .foregroundStyle(.white)
                        .font(.callout)
                    Spacer()
                }
                .padding()
            }
            
        }
    }
}
