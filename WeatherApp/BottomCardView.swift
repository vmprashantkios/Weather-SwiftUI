//
//  BottomCardView.swift
//  WeatherApp
//
//  Created by Prashant on 03/08/24.
//

import SwiftUI


struct BottomCardView: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .overlay(LinearGradient(colors: [Color(red: 0.24, green: 0.17, blue: 0.56, opacity: 1.0), Color(red: 0.61, green: 0.32, blue: 0.67, opacity: 0.7)], startPoint: .topTrailing, endPoint: .bottom))
            VStack {
                HStack {
                    Text("Today")
                        .foregroundStyle(Color.white)
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Spacer()
                    Text("21/02")
                        .foregroundStyle(Color.white)
                        .font(.title2)
                        .fontWeight(.medium)
                }
                .padding(.horizontal, 25)
               Divider()
                    .frame(height: 2)
                    .overlay(.white)
                    .opacity(0.5)
                VStack {
                    
                }
                
            }
                
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}
