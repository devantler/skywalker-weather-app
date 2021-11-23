//
//  CurrentLocationView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 23/11/2021.
//

import SwiftUI

struct CurrentLocationView: View {
    var tag: Int = 0
    var body: some View {
        LocationView()
    }
}

struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationView()
    }
}
