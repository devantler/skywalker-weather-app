//
//  CustomButton.swift
//  Skywalker
//
//  Created by Nikolai Emil Damm on 23/11/2021.
//

import SwiftUI

struct RoundButton: View {
    var action: () -> Void
    var iconSystemName: String
    var buttonText: String
    var size: CGFloat = 50
    var isDisabled = false
    var body: some View {
        Button {
            action()
        } label: {
            VStack{
                Image(systemName: iconSystemName)
                    .font(Font.system(.largeTitle))
                    .frame(width: size, height: size)
                    .foregroundColor(Color.white)
                    .background(isDisabled ? Color.red.opacity(0.5)  : Color.green )
                    .clipShape(Circle())
                Text(buttonText)
            }
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(action: {}, iconSystemName: "plus", buttonText: "Test Button")
    }
}
