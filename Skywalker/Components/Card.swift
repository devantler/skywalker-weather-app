//
//  CardView.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 23/11/2021.
//

import SwiftUI

struct Card<Content: View>: View  {
    var alignment: HorizontalAlignment = .center
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: alignment){
            ZStack
            {
                HStack{
                    Spacer()
                }
            }
            content
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius:16.0))
    }
    
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card{
            Text("Test")
        }
    }
}



