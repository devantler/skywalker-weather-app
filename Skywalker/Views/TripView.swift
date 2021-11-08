//
//  TripView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 26/10/2021.
//

import SwiftUI

struct TripView: View {
    var isEmpty: Bool = false
    @ObservedObject var tripViewModel: TripViewModel = TripViewModel()
    var body: some View {
        VStack{
            if(!isEmpty){
                Text("Trip View")
            } else {
                AddButtonView(label: "Add trip")
            }
        }
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView()
    }
}
