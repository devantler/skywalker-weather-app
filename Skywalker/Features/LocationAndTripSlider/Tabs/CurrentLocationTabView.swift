//
//  CurrentLocationTabView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 23/11/2021.
//

import SwiftUI

struct CurrentLocationTabView: View {
    var tag: Int
    var body: some View {
        CurrentLocationView().tabItem {
            Label("", systemImage: "location.circle")
        }.tag(tag)
    }
}

struct CurrentLocationTabView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationTabView(tag: 0)
    }
}
