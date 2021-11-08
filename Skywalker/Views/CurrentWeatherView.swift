//
//  CurrentWeatherView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 08/11/2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    var date: Date = Date()
    var locationName: String = "Odense"
    var temperature: Double = 21.24
    var body: some View {
        VStack{
            HStack{
                //WeatherSymbolView()
                VStack{
                    Text(date.description)
                    Text(date.description)
                }
            }
            //TemperatureView(temperature)
            Text(locationName)
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(date: Date(), locationName: "Odense", temperature:  20.11)
    }
}
