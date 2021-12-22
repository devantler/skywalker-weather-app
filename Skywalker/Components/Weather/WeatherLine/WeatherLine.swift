//
//  CurrentWeatherView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 08/11/2021.
//

import SwiftUI

struct WeatherLine: View {
    @ObservedObject var viewModel: WeatherLineViewModel
    
    init(location: Location, weather: Weather, styling: WeatherLineStyling = WeatherLineStyling()) {
        self.viewModel = .init(location: location, weather: weather, styling: styling)
    }
    
    var body: some View {
        if viewModel.styling.vertical {
            VStack{
                WeatherIcon(weatherStatus: viewModel.weather.status, styling: WeatherIconStyling(size: viewModel.styling.iconSize))
                Text(viewModel.location.name).font(viewModel.styling.fontStyle)
                Text((viewModel.weather.temperature?.description ?? "") + "°C").font(viewModel.styling.fontStyle)
            }
        } else {
            HStack{
                WeatherIcon(weatherStatus: viewModel.weather.status, styling: WeatherIconStyling(size: viewModel.styling.iconSize))
                Text(viewModel.location.name).font(viewModel.styling.fontStyle)
                Text((viewModel.weather.temperature?.description ?? "") + "°C").font(viewModel.styling.fontStyle)
            }
        }
    }
}

struct WeatherLine_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLine(location: Location(name: "Odense"), weather: .init(date: Date(), temperature: 21.45, status: WeatherStatus.Clear))
    }
}
