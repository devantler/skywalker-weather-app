import Foundation

enum SaveLocationError : Error {
    case maxLocationsReached;
    case invalidLocationName;
    case unset;
}
