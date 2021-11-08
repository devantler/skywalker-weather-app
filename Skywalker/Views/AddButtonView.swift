import SwiftUI

struct AddButtonView: View {
    var label: String
    
    var body: some View {
        Button {
            print("Round Action")
        } label: {
            VStack{
                Image(systemName: "plus")
                    .font(Font.system(.largeTitle))
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .clipShape(Circle())
                Text(label)
            }
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(label: "A button")
    }
}
