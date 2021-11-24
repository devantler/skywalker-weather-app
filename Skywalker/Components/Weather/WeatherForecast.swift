//
//  WeatherForecastView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 08/11/2021.
//

import SwiftUI

struct WeatherForecast: View {
    var body: some View {
        VStack{
            HStack{
                WeatherIcon(weatherStatus: WeatherStatus.Cloudy)
                Text("Odense")
                Text("8.3")
                Spacer()
            }.border(Color.gray)
            HStack{
                WeatherIcon(weatherStatus: WeatherStatus.Sunny)
                Text("Kolding")
                Text("10")
                Spacer()
            }.border(Color.gray)
            HStack{
                WeatherIcon(weatherStatus: WeatherStatus.Cloudy)
                Text("Århus")
                Text("7.1")
                Spacer()
            }.border(Color.gray)
            HStack{
                WeatherIcon(weatherStatus: WeatherStatus.Sunny)
                Text("Sønderbog")
                Text("10.8")
                Spacer()
            }.border(Color.gray)
        }
        
    }
}

struct WeatherForecast_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecast()
    }
}
