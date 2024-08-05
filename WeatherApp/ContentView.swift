//
//  ContentView.swift
//  WeatherApp
//
//  Created by Prashant on 02/08/24.
//

import SwiftUI
let tempStyle: Measurement<UnitTemperature>.FormatStyle =
    .measurement(
        numberFormatStyle: .number.precision(.fractionLength(0...1))
    )
struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel(weatherService: WeatherService())
    @State var selectedCityIndex = 0
    @State var mapImage: UIImage?
    var cityArray = ["Delhi", "Mumbai", "Pune", "Haryana", "Gujrat"]
    
    var body: some View {
       
        ZStack(alignment: .bottom) {
            
            Rectangle()
                .overlay(LinearGradient(colors: [Color(red: 0.24, green: 0.17, blue: 0.56, opacity: 1.0), Color(red: 0.61, green: 0.32, blue: 0.67, opacity: 1.0)], startPoint: .top, endPoint: .bottom))
            ScrollView {
            VStack() {
                CityView(cityArray: cityArray, selectedCityIndex: $selectedCityIndex)
                Text(viewModel.weather?.name ?? "Delhi")
                    .foregroundStyle(Color.white)
                    .font(Font.system(size: 40))
                    .fontWeight(.bold)
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(viewModel.weather?.weather?.first?.icon ?? "")@2x.png"))
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                HStack() {
                    Text("\(viewModel.fahrenheitToCelsius(viewModel.weather?.main?.temp ?? 0.0))")
                        .foregroundStyle(Color.white)
                        .font(Font.system(size: 30))
                        .fontWeight(.bold)
                    Divider()
                        .frame(width: 3)
                        .frame(height: 35)
                        .overlay(.white)
                    Text(viewModel.weather?.weather?.first?.main ?? "Clear")
                        .foregroundStyle(Color.white)
                        .font(Font.system(size: 30))
                        .fontWeight(.bold)
                }
               
                    HStack {
                        CardView(icon: "wind", title: "Wind", value: "\(viewModel.weather?.wind?.speed ?? 0) km/h")
                        CardView(icon: "thermometer.variable.and.figure", title: "Feel Like", value: "\(viewModel.fahrenheitToCelsius(viewModel.weather?.main?.feels_like ?? 0)) ")
                    }
                    .padding()
                    
                    HStack {
                        CardView(icon: "humidity", title: "Humidity", value: "\(viewModel.weather?.main?.humidity ?? 0) %")
                        SunCard(icon: "sunrise", title: "Sunrise", riseTime: viewModel.getTimeFromTimeStamp(Double(viewModel.weather?.sys?.sunrise ?? 0)) , setTime: viewModel.getTimeFromTimeStamp(Double(viewModel.weather?.sys?.sunset ?? 0)))
                    }
                    .frame(maxHeight: .infinity)
                    .padding()
                    
                    Spacer()
                    if let image = mapImage {
                        Image(uiImage: image)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
            }
           
        }
        .onChange(of: selectedCityIndex, { oldValue, newValue in
            getCityWeather()
        })
        .onChange(of: viewModel.dataGet, perform: { newValue in
            if newValue {
                MapSnapShotGenerator(lat: viewModel.weather?.coord?.lat ?? 0.0, long: viewModel.weather?.coord?.lon ?? 0.0).getSnapShot(width: UIScreen.main.bounds.width - 40, height: 200, completion: { image in
                    mapImage = image
                })
                viewModel.dataGet.toggle()
            }
        })
        .onAppear {
            getCityWeather()
        }
    }
    
    func getCityWeather() {
        viewModel.fetchWeatherFor(city: cityArray[selectedCityIndex])
    }

}

#Preview {
    ContentView()
}
