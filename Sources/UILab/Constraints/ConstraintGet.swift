//
//  UILab
//
//  Created on 16.02.2020.
//  Using Swift 5.0
//

import UIKit

public extension UIView {
  func get(_ attribute: Attribute) -> Constraints {
    var constraints = Constraints()
    self.constraints.forEach { $0.firstAttribute == attribute ? constraints.append($0) : nil }
    return constraints
  }
}
