//
//  CurrentWeatherView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 08/11/2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject var currentWeatherViewModel: CurrentWeatherViewModel

    init(locationName: String, weather: Weather) {
        self.currentWeatherViewModel = .init(locationName: locationName, weather: weather)
    }
    
    var body: some View {
        VStack{
            HStack{
                WeatherIconView(weatherStatus: currentWeatherViewModel.weather.weatherStatus)
                VStack{
                    Text(currentWeatherViewModel.locationName)
                    Text(currentWeatherViewModel.weather.temperature.description)
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
