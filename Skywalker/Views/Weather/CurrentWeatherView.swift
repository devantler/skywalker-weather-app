//
//  CurrentWeatherView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 08/11/2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    var locationName: String
    var date: Date
    var weatherStatus: WeatherStatus
    var temperature: Double

    var body: some View {
        VStack{
            HStack{
                WeatherIconView(weatherStatus: weatherStatus)
                VStack{
                    Text(locationName)
                    Text(temperature.description)
                }
            }
            
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(locationName: "Odense", date: Date(), weatherStatus: WeatherStatus.Sunny, temperature: 22.1)
    }
}
