//
//  UILab
//
//  Created on 11.02.2020.
//  Using Swift 5.0
//

import UIKit

public extension UIView {
  var top: YAxis { return topAnchor }
  var left: XAxis { return leftAnchor }
  var leading: XAxis { return leadingAnchor }
  var trailing: XAxis { return trailingAnchor }
  var bottom: YAxis { return bottomAnchor }
  var right: XAxis { return rightAnchor }
  var width: Dimension { return widthAnchor }
  var height: Dimension { return heightAnchor }
  var centerY: YAxis { return centerYAnchor }
  var centerX: XAxis { return centerXAnchor }

  var superCenterY: YAxis? { return superview?.centerYAnchor }
  var superCenterX: XAxis? { return superview?.centerXAnchor }
  var superTop: YAxis? { return superview?.top }
  var superLeft: XAxis? { return superview?.left }
  var superLeading: XAxis? { return superview?.leading }
  var superBottom: YAxis? { return superview?.bottomAnchor }
  var superRight: XAxis? { return superview?.rightAnchor }
  var superTrailing: XAxis? { return superview?.trailingAnchor }
}
