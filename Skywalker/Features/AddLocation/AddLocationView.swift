import SwiftUI

struct AddLocationView: View {
    @EnvironmentObject var userData: UserData
    @StateObject var viewModel: AddLocationViewModel = AddLocationViewModel()
    
    var body: some View {
        VStack{
            TextField("Location name", text: $viewModel.location.name).textFieldStyle(RoundedBorderTextFieldStyle()).padding(20)
            
            RoundButton(action: {
                userData.saveLocation(locationName: viewModel.location.name)
                viewModel.location.name = ""
            }, iconSystemName: "plus", buttonText: "")
        }
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView()
    }
}
