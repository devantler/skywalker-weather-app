//
//  TripTabView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 23/11/2021.
//

import SwiftUI

struct TripTabView: View {
    var tag: Int
    var body: some View {
        TripView()
            .tabItem {
                Label("", systemImage: "airplane.departure")
            }.tag(tag)
    }
}

struct TripTabView_Previews: PreviewProvider {
    static var previews: some View {
        TripTabView(tag: 0)
    }
}
