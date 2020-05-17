import Foundation

class Constants {
    static let debug = false
}

class UserDefaultKeys {
    static let interfaceStyle = "interfaceStyle"
    static let lastActivitySyncDate = "lastActivitySyncDate"
    static let lastWorkout = "lastWorkout"
    static let lastSyncDate = "lastSyncDate"
    static let setupFinished = "setupFinished"
    static let workoutFilter = "workoutFilter"
}

enum InterfaceStyle: Int {
    case automatic
    case light
    case dark
}

extension Notification.Name {
    static let didChangeInterfaceStyle = Notification.Name("didChangeInterfaceStyle")
}