import Foundation
import SwiftUI

class LocationAndTripSliderViewModel : ObservableObject{
    @Published var tabs: Tabs
    
    init(selectedTab: Int){
        tabs = Tabs(selected: selectedTab)
    }
    
    func setupTabsAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemBlue
    }
}
