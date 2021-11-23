import SwiftUI

struct AddTripView: View {
    
    var body: some View {
        VStack{
            RoundButton(action: {print("Added trip")}, iconSystemName: "plus", buttonText: "Add Trip")
        }

    }
}

struct AddTripView_Previews: PreviewProvider {
    static var previews: some View {
        AddTripView()
    }
}
