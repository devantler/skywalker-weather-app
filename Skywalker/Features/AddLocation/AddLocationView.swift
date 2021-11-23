import SwiftUI

struct AddLocationView: View {
    @EnvironmentObject var userData: UserData
    @State var locationName: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            TextField("Location name", text: $locationName).multilineTextAlignment(.center).textFieldStyle(.roundedBorder)
            
            RoundButton(action: {
                showAlert = true
                userData.saveLocation(locationName: locationName)
                locationName = ""
            }, iconSystemName: "plus", buttonText: "Add Location")
        }
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView()
    }
}
