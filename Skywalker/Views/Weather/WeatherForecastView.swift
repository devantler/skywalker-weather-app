//
//  WeatherForecastView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 08/11/2021.
//

import SwiftUI

struct WeatherForecastView: View {
    var body: some View {
        VStack{
            HStack{
                WeatherIconView(weatherStatus: WeatherStatus.Cloudy)
                Text("Odense")
                Text("8.3")
            }
            HStack{
                WeatherIconView(weatherStatus: WeatherStatus.Sunny)
                Text("Kolding")
                Text("10")
            }
            HStack{
                WeatherIconView(weatherStatus: WeatherStatus.Cloudy)
                Text("Århus")
                Text("7.1")
            }
            HStack{
                WeatherIconView(weatherStatus: WeatherStatus.Sunny)
                Text("Sønderbog")
                Text("10.8")
            }
        }
        
    }
}

struct WeatherForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView()
    }
}
