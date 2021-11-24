//
//  CurrentWeatherView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 08/11/2021.
//

import SwiftUI

struct WeatherLine: View {
    var vertical: Bool = true
    @ObservedObject var viewModel: WeatherLineViewModel

    init(location: Location, weather: Weather) {
        self.viewModel = .init(location: location, weather: weather)
    }
    
    var body: some View {
        VStack{
            HStack{
                WeatherIcon(size: 50, weatherStatus: viewModel.weather.status)
                VStack{
                    Text(viewModel.location.name).font(Font.system(.title3))
                    Text(viewModel.weather.temperature.description).font(Font.system(.title3))
                }
            }
            
        }
    }
}

struct WeatherLine_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLine(location: Location(name: "Odense"), weather: .init(date: Date(), temperature: 21.45, status: WeatherStatus.Sunny))
    }
}
