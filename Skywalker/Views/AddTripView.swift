import SwiftUI

struct AddTripView: View {
    
    var body: some View {
        Button {
            print("Added trip")
        } label: {
            VStack{
                Image(systemName: "plus")
                    .font(Font.system(.largeTitle))
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .clipShape(Circle())
                Text("Add Trip")
            }
        }
    }
}

struct AddTripView_Previews: PreviewProvider {
    static var previews: some View {
        AddTripView()
    }
}
