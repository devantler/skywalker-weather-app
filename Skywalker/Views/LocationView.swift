import SwiftUI

struct LocationView: View {
    var isEmpty: Bool = false
    @ObservedObject var locationViewModel: LocationViewModel = LocationViewModel()
    var body: some View {
        VStack{
            if(!isEmpty){
                CurrentWeatherView()
            } else {
                AddButtonView(label: "Add location")
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
