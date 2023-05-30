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

public enum UILab {
  public enum Settings {
    public static var debugMonitoringType: DebugMonitoringType = .none
  }
}
