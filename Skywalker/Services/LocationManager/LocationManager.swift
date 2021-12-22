import Combine
import CoreLocation
import SwiftUI


public let defaultAuthorizationRequestType = CLAuthorizationStatus.authorizedWhenInUse
public let allowedAuthorizationTypes : Set<CLAuthorizationStatus> = Set([.authorizedWhenInUse, .authorizedAlways])
    
public class LocationManager: NSObject, ObservableObject {
    
    public let locationManager = CLLocationManager()
    public let locationWillChange = PassthroughSubject<CLLocation, Never>()
    public let cityWillChange = PassthroughSubject<String, Never>()
    
    @Published public internal(set) var location: CLLocation? {
        willSet {
            locationWillChange.send(newValue ?? CLLocation())
        }
    }
    
    @Published public internal(set) var city: String? {
        willSet {
            cityWillChange.send(newValue ?? String())
        }
    }
    
    @Published public var authorizationStatus: CLAuthorizationStatus?
    public var onAuthorizationStatusDenied : ()->Void = {presentLocationSettingsAlert()}
    
    public override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    public func requestAuthorization(authorizationRequestType: CLAuthorizationStatus = defaultAuthorizationRequestType) -> Void {
        if self.authorizationStatus == CLAuthorizationStatus.denied {
            onAuthorizationStatusDenied()
        }
        else {
            switch authorizationRequestType {
            case .authorizedWhenInUse:
                self.locationManager.requestWhenInUseAuthorization()
            case .authorizedAlways:
                self.locationManager.requestAlwaysAuthorization()
            default:
                print("WARNING: Only `when in use` and `always` types can be requested.")
            }
        }
    }
    
    public func start() throws -> Void {
        self.requestAuthorization()
        
        if let status = self.authorizationStatus {
            guard allowedAuthorizationTypes.contains(status) else {
                throw LocationManagerError.noAuthorization
            }
        }
        self.locationManager.startUpdatingLocation()
    }
    
    public func stop() -> Void {
        self.locationManager.stopUpdatingLocation()
    }
}

public func presentLocationSettingsAlert(alertText : String? = nil) -> Void {
#if os(iOS)
    let alertController = UIAlertController (title: "Enable Location Access", message: alertText ?? "The location access for this app is set to 'never'. Enable location access in the application settings. Go to Settings now?", preferredStyle: .alert)
    let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
        guard let settingsUrl = URL(string:UIApplication.openSettingsURLString) else {
            return
        }
        UIApplication.shared.open(settingsUrl)
    }
    alertController.addAction(settingsAction)
    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    alertController.addAction(cancelAction)
    UIApplication.shared.windows[0].rootViewController?.present(alertController, animated: true, completion: nil)
#endif
}

extension CLAuthorizationStatus {
    var name: String {
        switch self {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }
}
