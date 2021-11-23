//
//  CurrentWeatherView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 08/11/2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel

    init(locationName: String, weather: Weather) {
        self.weatherViewModel = .init(locationName: locationName, weather: weather)
    }
    
    var body: some View {
        VStack{
            HStack{
                WeatherIconView(size: 50, weatherStatus: weatherViewModel.weather.weatherStatus)
                VStack{
                    Text(weatherViewModel.locationName).font(Font.system(.title3))
                    Text(weatherViewModel.weather.temperature.description).font(Font.system(.title3))
                }
            }
            
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(locationName: "Odense", weather: .init(date: Date(), temperature: 21.45, weatherStatus: WeatherStatus.Sunny))
    }
}
