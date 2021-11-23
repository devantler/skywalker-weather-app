import SwiftUI

struct AddLocationView: View {
    @EnvironmentObject var userData: UserData
    @State var locationName: String = ""
    
    var body: some View {
        VStack{
            TextField("Location name", text: $locationName).textFieldStyle(RoundedBorderTextFieldStyle()).padding(20)
            
            RoundButton(action: {
                userData.saveLocation(locationName: locationName)
                locationName = ""
            }, iconSystemName: "plus", buttonText: "")
        }
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView()
    }
}
