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
    case left               (XAxis, Inset = 0)
    case leftOf             (View, Inset = 0)
    case leftgte            (XAxis, Inset = 0)
    case leftlte            (XAxis, Inset = 0)
    case right              (XAxis, Inset = 0)
    case rightOf            (View, Inset = 0)
    case rightgte           (XAxis, Inset = 0)
    case rightlte           (XAxis, Inset = 0)
    case top                (YAxis, Inset = 0)
    case topOf              (View, Inset = 0)
    case topgte             (YAxis, Inset = 0)
    case toplte             (YAxis, Inset = 0)
    case bottom             (YAxis, Inset = 0)
    case bottomOf           (View, Inset = 0)
    case bottomgte          (YAxis, Inset = 0)
    case bottomlte          (YAxis, Inset = 0)
    case leading            (XAxis, Inset = 0)
    case leadingOf          (View, Inset = 0)
    case leadinggte         (XAxis, Inset = 0)
    case leadinglte         (XAxis, Inset = 0)
    case trailing           (XAxis, Inset = 0)
    case trailingOf         (View, Inset = 0)
    case trailinggte        (XAxis, Inset = 0)
    case trailinglte        (XAxis, Inset = 0)
    case width              (Constant)
    case widthOf            (View, Inset = 0)
    case widthgte           (Constant)
    case widthlte           (Constant)
    case height             (Constant)
    case heightOf           (View, Inset = 0)
    case heightgte          (Constant)
    case heightlte          (Constant)
    case centerX            (XAxis, Inset = 0)
    case centerXOf          (View, Inset = 0)
    case centerY            (YAxis, Inset = 0)
    case centerYOf          (View, Inset = 0)
    case center             (View, x: Inset = 0, y: Inset = 0)
    case widthMultiple      (Dimension, Multiple = 1, Inset = 0)
    case heightMultiple    (Dimension, Multiple = 1, Inset = 0)
    
    func constraint(_ view: UIView) -> Constraints{
        switch self {
        case .left(let anchor, let inset):              return [view.left.constraint(equalTo: anchor, constant: inset)]
        case .leftOf(let anchorView, let inset):        return [view.left.constraint(equalTo: anchorView.left, constant: inset)]
        case .leftgte(let anchor, let inset):           return [view.left.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case .leftlte(let anchor, let inset):           return [view.left.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case .right(let anchor, let inset):             return [view.right.constraint(equalTo: anchor, constant: -inset)]
        case .rightOf(let anchorView, let inset):       return [view.right.constraint(equalTo: anchorView.right, constant: -inset)]
        case .rightgte(let anchor, let inset):          return [view.right.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case .rightlte(let anchor, let inset):          return [view.right.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case .top(let anchor, let inset):               return [view.top.constraint(equalTo: anchor, constant: inset)]
        case .topOf(let anchorView, let inset):         return [view.top.constraint(equalTo: anchorView.top, constant: inset)]
        case .topgte(let anchor, let inset):            return [view.top.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case .toplte(let anchor, let inset):            return [view.top.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case .bottom(let anchor, let inset):            return [view.bottom.constraint(equalTo: anchor, constant: -inset)]
        case .bottomOf(let anchorView, let inset):      return [view.bottom.constraint(equalTo: anchorView.bottom, constant: -inset)]
        case .bottomgte(let anchor, let inset):         return [view.bottom.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case .bottomlte(let anchor, let inset):         return [view.bottom.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case .leading(let anchor, let inset):           return [view.leading.constraint(equalTo: anchor, constant: inset)]
        case .leadingOf(let anchorView, let inset):     return [view.leading.constraint(equalTo: anchorView.leading, constant: inset)]
        case .leadinggte(let anchor, let inset):        return [view.leading.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case .leadinglte(let anchor, let inset):        return [view.leading.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case .trailing(let anchor, let inset):          return [view.trailing.constraint(equalTo: anchor, constant: inset)]
        case .trailingOf(let anchorView, let inset):    return [view.trailing.constraint(equalTo: anchorView.trailing, constant: inset)]
        case .trailinggte(let anchor, let inset):       return [view.trailing.constraint(greaterThanOrEqualTo: anchor, constant: inset)]
        case .trailinglte(let anchor, let inset):       return [view.trailing.constraint(lessThanOrEqualTo: anchor, constant: inset)]
        case .width(let constant):                      return [view.width.constraint(equalToConstant: constant)]
        case .widthOf(let anchorView, let inset):       return [view.width.constraint(equalTo: anchorView.width, constant: inset)]
        case .widthgte(let constant):                   return [view.width.constraint(greaterThanOrEqualToConstant: constant)]
        case .widthlte(let constant):                   return [view.width.constraint(lessThanOrEqualToConstant: constant)]
        case .height(let constant):                     return [view.height.constraint(equalToConstant: constant)]
        case .heightOf(let anchorView, let inset):      return [view.height.constraint(equalTo: anchorView.height, constant: inset)]
        case .heightgte(let constant):                  return [view.height.constraint(greaterThanOrEqualToConstant: constant)]
        case .heightlte(let constant):                  return [view.height.constraint(lessThanOrEqualToConstant: constant)]
        case .centerX(let anchor, let inset):           return [view.centerX.constraint(equalTo: anchor, constant: inset)]
        case .centerXOf(let anchorView, let inset):     return [view.centerX.constraint(equalTo: anchorView.centerX, constant: inset)]
        case .centerY(let anchor, let inset):           return [view.centerY.constraint(equalTo: anchor, constant: inset)]
        case .centerYOf(let anchorView, let inset):     return [view.centerY.constraint(equalTo: anchorView.centerY, constant: inset)]
            
        case .widthMultiple(let dimension, let multiple, let inset):
            return [view.width.constraint(equalTo: dimension, multiplier: multiple, constant: inset)]
        case .heightMultiple(let dimension, let multiple, let inset):
            return [view.height.constraint(equalTo: dimension, multiplier: multiple, constant: inset)]
        case .center(let anchorView, x: let xInset, y: let yInset):
            return [view.centerX.constraint(equalTo: anchorView.centerX, constant: xInset),
                    view.centerY.constraint(equalTo: anchorView.centerY, constant: yInset)]
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
