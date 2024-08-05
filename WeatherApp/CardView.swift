//
//  CardView.swift
//  WeatherApp
//
//  Created by Prashant on 03/08/24.
//

import SwiftUI

struct CardView: View {
    var icon: String
    var title: String
    var value: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .blendMode(.softLight)
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
                Text(value)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.medium)
            }
            .padding()
        }
    }
}
