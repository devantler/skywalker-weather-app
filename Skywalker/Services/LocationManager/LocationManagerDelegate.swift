import CoreLocation
extension LocationManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorizationStatus = status
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler:
                                            {
            placemarks, error -> Void in
        
            guard let placeMark = placemarks?.first else { return }
        
            if let city = placeMark.locality {
                self.city = city
            }
        })
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let clErr = error as? CLError {
            switch clErr {
            case CLError.denied : do {
                self.stop()
                self.requestAuthorization()
            }
            case CLError.locationUnknown : print(#function, "Location manager is unable to retrieve a location.")
            default: print(#function, "Location manager failed with unknown CoreLocation error.")
            }
        }
        else {
            print(#function, "Location manager failed with unknown error", error.localizedDescription)
        }
    }
}
