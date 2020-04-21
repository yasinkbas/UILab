//
//  UILab
//
//  Created on 11.02.2020.
//  Using Swift 5.0
//

import Foundation

public struct Padding {
    static var zero: Padding {
        return Padding(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    let top: Inset
    let left: Inset
    let bottom: Inset
    let right: Inset
    
    public init(top: Inset, left: Inset, bottom: Inset, right: Inset) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
}

public struct Axises {
    static var empty: Axises {
        return Axises()
    }
    
    let top: YAxis?
    let left: XAxis?
    let bottom: YAxis?
    let right: XAxis?
    
    public init(top: YAxis? = nil, left: XAxis? = nil, bottom: YAxis? = nil, right: XAxis? = nil) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
    
    public init(_ view: UIView?) {
        self.top = view?.top
        self.left = view?.left
        self.bottom = view?.bottom
        self.right = view?.right
    }
}

internal struct ConstraintWrapper {
    let axises: Axises
    let padding: Padding?
    let width: Constant
    let height: Constant
    let enableInsets: Bool
    
    internal init(axises: Axises, padding: Padding? = Padding.zero, width: Constant = 0, height: Constant = 0, enableInsets: Bool = true) {
        self.axises = axises
        self.padding = padding
        self.width = width
        self.height = height
        self.enableInsets = enableInsets
    }
}

public enum ConstraintType {
    case left                   (XAxis, Inset = 0)
    case leftOf                 (View, Inset = 0)
    case leftgte                (XAxis, Inset = 0)
    case leftlte                (XAxis, Inset = 0)
    case right                  (XAxis, Inset = 0)
    case rightOf                (View, Inset = 0)
    case rightgte               (XAxis, Inset = 0)
    case rightlte               (XAxis, Inset = 0)
    case top                    (YAxis, Inset = 0)
    case topOf                  (View, Inset = 0)
    case topgte                 (YAxis, Inset = 0)
    case toplte                 (YAxis, Inset = 0)
    case bottom                 (YAxis, Inset = 0)
    case bottomOf               (View, Inset = 0)
    case bottomgte              (YAxis, Inset = 0)
    case bottomlte              (YAxis, Inset = 0)
    case leading                (XAxis, Inset = 0)
    case leadingOf              (View, Inset = 0)
    case leadinggte             (XAxis, Inset = 0)
    case leadinglte             (XAxis, Inset = 0)
    case trailing               (XAxis, Inset = 0)
    case trailingOf             (View, Inset = 0)
    case trailinggte            (XAxis, Inset = 0)
    case trailinglte            (XAxis, Inset = 0)
    case width                  (Constant)
    case widthOf                (View, Inset = 0)
    case widthgte               (Constant)
    case widthlte               (Constant)
    case height                 (Constant)
    case heightOf               (View, Inset = 0)
    case heightgte              (Constant)
    case heightlte              (Constant)
    case centerX                (XAxis, Inset = 0)
    case centerXOf              (View, Inset = 0)
    case centerY                (YAxis, Inset = 0)
    case centerYOf              (View, Inset = 0)
    
    case center                 (View, x: Inset = 0, y: Inset = 0)
    case widthMultiple          (Dimension, Multiple = 1, Inset = 0)
    case heightMultiple         (Dimension, Multiple = 1, Inset = 0)
    
    case leftSpaceAfter         (XAxis, Multiple = 1)
    case leftSpaceAfterlte      (XAxis, Multiple = 1)
    case leftSpaceAftergte      (XAxis, Multiple = 1)
    case rightSpaceAfter        (XAxis, Multiple = 1)
    case rightSpaceAfterlte     (XAxis, Multiple = 1)
    case rightSpaceAftergte     (XAxis, Multiple = 1)
    case topSpaceBelow          (YAxis, Multiple = 1)
    case topSpaceBelowlte       (YAxis, Multiple = 1)
    case topSpaceBelowgte       (YAxis, Multiple = 1)
    case bottomSpaceBelow       (YAxis, Multiple = 1)
    case bottomSpaceBelowlte    (YAxis, Multiple = 1)
    case bottomSpaceBelowgte    (YAxis, Multiple = 1)
    case leadingSpaceAfter      (XAxis, Multiple = 1)
    case leadingSpaceAfterlte   (XAxis, Multiple = 1)
    case leadingSpaceAftergte   (XAxis, Multiple = 1)
    case trailingSpaceAfter     (XAxis, Multiple = 1)
    case trailingSpaceAfterlte  (XAxis, Multiple = 1)
    case trailingSpaceAftergte  (XAxis, Multiple = 1)
    case centerXSpaceAfter      (XAxis, Multiple = 1)
    case centerXSpaceAfterlte   (XAxis, Multiple = 1)
    case centerXSpaceAftergte   (XAxis, Multiple = 1)
    case centerYSpaceBelow      (YAxis, Multiple = 1)
    case centerYSpaceBelowlte   (YAxis, Multiple = 1)
    case centerYSpaceBelowgte   (YAxis, Multiple = 1)
    
    func constraint(_ view: UIView) -> Constraints {
        switch self {
        case let .left(anchor, inset):                  return [view.left.constraint(equalTo: anchor, constant: inset)]
        case let .leftOf(anchorView, inset):            return [view.left.constraint(equalTo: anchorView.left, constant: inset)]
        case let .leftgte(anchor, inset):               return [view.left.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case let .leftlte(anchor, inset):               return [view.left.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case let .right(anchor, inset):                 return [view.right.constraint(equalTo: anchor, constant: -inset)]
        case let .rightOf(anchorView, inset):           return [view.right.constraint(equalTo: anchorView.right, constant: -inset)]
        case let .rightgte(anchor, inset):              return [view.right.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case let .rightlte(anchor, inset):              return [view.right.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case let .top(anchor, inset):                   return [view.top.constraint(equalTo: anchor, constant: inset)]
        case let .topOf(anchorView, inset):             return [view.top.constraint(equalTo: anchorView.top, constant: inset)]
        case let .topgte(anchor, inset):                return [view.top.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case let .toplte(anchor, inset):                return [view.top.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case let .bottom(anchor, inset):                return [view.bottom.constraint(equalTo: anchor, constant: -inset)]
        case let .bottomOf(anchorView, inset):          return [view.bottom.constraint(equalTo: anchorView.bottom, constant: -inset)]
        case let .bottomgte(anchor, inset):             return [view.bottom.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case let .bottomlte(anchor, inset):             return [view.bottom.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case let .leading(anchor, inset):               return [view.leading.constraint(equalTo: anchor, constant: inset)]
        case let .leadingOf(anchorView, inset):         return [view.leading.constraint(equalTo: anchorView.leading, constant: inset)]
        case let .leadinggte(anchor, inset):            return [view.leading.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case let .leadinglte(anchor, inset):            return [view.leading.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case let .trailing(anchor, inset):              return [view.trailing.constraint(equalTo: anchor, constant: -inset)]
        case let .trailingOf(anchorView, inset):        return [view.trailing.constraint(equalTo: anchorView.trailing, constant: -inset)]
        case let .trailinggte(anchor, inset):           return [view.trailing.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case let .trailinglte(anchor, inset):           return [view.trailing.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case let .width(constant):                      return [view.width.constraint(equalToConstant: constant)]
        case let .widthOf(anchorView, inset):           return [view.width.constraint(equalTo: anchorView.width, constant: inset)]
        case let .widthgte(constant):                   return [view.width.constraint(greaterThanOrEqualToConstant: constant)]
        case let .widthlte(constant):                   return [view.width.constraint(lessThanOrEqualToConstant: constant)]
        case let .height(constant):                     return [view.height.constraint(equalToConstant: constant)]
        case let .heightOf(anchorView, inset):          return [view.height.constraint(equalTo: anchorView.height, constant: inset)]
        case let .heightgte(constant):                  return [view.height.constraint(greaterThanOrEqualToConstant: constant)]
        case let .heightlte(constant):                  return [view.height.constraint(lessThanOrEqualToConstant: constant)]
        case let .centerX(anchor, inset):               return [view.centerX.constraint(equalTo: anchor, constant: inset)]
        case let .centerXOf(anchorView, inset):         return [view.centerX.constraint(equalTo: anchorView.centerX, constant: inset)]
        case let .centerY(anchor, inset):               return [view.centerY.constraint(equalTo: anchor, constant: inset)]
        case let .centerYOf(anchorView, inset):         return [view.centerY.constraint(equalTo: anchorView.centerY, constant: inset)]
            
        case let .widthMultiple(dimension, multiplier, inset):
            return [view.width.constraint(equalTo: dimension, multiplier: multiplier, constant: inset)]
        case let .heightMultiple(dimension, multiplier, inset):
            return [view.height.constraint(equalTo: dimension, multiplier: multiplier, constant: inset)]
        case let .center(anchorView, x: xInset, y: yInset):
            return [view.centerX.constraint(equalTo: anchorView.centerX, constant: xInset),
                    view.centerY.constraint(equalTo: anchorView.centerY, constant: yInset)]
            
        case let .leftSpaceAfter(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.left.constraint(equalToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .leftSpaceAfterlte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.left.constraint(lessThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .leftSpaceAftergte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.left.constraint(greaterThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
            
        case let .rightSpaceAfter(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.right.constraint(equalToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .rightSpaceAfterlte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.right.constraint(lessThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .rightSpaceAftergte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.right.constraint(greaterThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
            
        case let .topSpaceBelow(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.top.constraint(equalToSystemSpacingBelow: anchor, multiplier: multiplier)]
        case let .topSpaceBelowlte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.top.constraint(lessThanOrEqualToSystemSpacingBelow: anchor, multiplier: multiplier)]
        case let .topSpaceBelowgte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.top.constraint(greaterThanOrEqualToSystemSpacingBelow: anchor, multiplier: multiplier)]
            
        case let .bottomSpaceBelow(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.bottom.constraint(equalToSystemSpacingBelow: anchor, multiplier: multiplier)]
        case let .bottomSpaceBelowlte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.bottom.constraint(lessThanOrEqualToSystemSpacingBelow: anchor, multiplier: multiplier)]
        case let .bottomSpaceBelowgte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.bottom.constraint(greaterThanOrEqualToSystemSpacingBelow: anchor, multiplier: multiplier)]
            
        case let .leadingSpaceAfter(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.leading.constraint(equalToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .leadingSpaceAfterlte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.leading.constraint(lessThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .leadingSpaceAftergte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.leading.constraint(greaterThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
            
        case let .trailingSpaceAfter(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.trailing.constraint(equalToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .trailingSpaceAfterlte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.trailing.constraint(lessThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .trailingSpaceAftergte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.trailing.constraint(greaterThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
            
        case let .centerXSpaceAfter(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.centerX.constraint(equalToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .centerXSpaceAfterlte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.centerX.constraint(lessThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
        case let .centerXSpaceAftergte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.centerX.constraint(greaterThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)]
            
        case let .centerYSpaceBelow(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.centerY.constraint(equalToSystemSpacingBelow: anchor, multiplier: multiplier)]
        case let .centerYSpaceBelowlte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.centerY.constraint(lessThanOrEqualToSystemSpacingBelow: anchor, multiplier: multiplier)]
        case let .centerYSpaceBelowgte(anchor, multiplier):
            guard #available(iOS 11.0, *) else { fatalError() }
            return [view.centerY.constraint(greaterThanOrEqualToSystemSpacingBelow: anchor, multiplier: multiplier)]
            
        }
    }
}

public enum ConstraintDirectionType {
    case top                (Inset)
    case left               (Inset)
    case bottom             (Inset)
    case right              (Inset)
    case width
    case height
}
