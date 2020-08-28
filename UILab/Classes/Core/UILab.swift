//
//  UILab
//
//  Created on 12.02.2020.
//  Using Swift 5.0
//

import Foundation

public enum DebugMonitoringType {
    case verbose
    case `import`
    case none
}

public class UILab {
    public class Settings {
        public static var debug: DebugMonitoringType = .none
    }
}


