import Foundation
import SwiftUI

class LocationAndTripSliderViewModel : ObservableObject{
    @Published var tabs: Tabs = Tabs()
    
    func setupTabsAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemBlue
    }
}
