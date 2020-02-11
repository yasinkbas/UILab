//
//  EnumTypes.swift
//  FBSnapshotTestCase
//
//  Created by Yasin Akbaş on 11.02.2020.
//

import Foundation

public struct Padding {
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

public enum RawConstraintType {
    case top
    case left
    case bottom
    case right
    case centerY
    case centerX
    case width
    case height
    
    var constraint: NSLayoutConstraint.Attribute {
        switch self {
        case.top: return NSLayoutConstraint.Attribute.top
        case .left: return NSLayoutConstraint.Attribute.left
        case .bottom: return NSLayoutConstraint.Attribute.bottom
        case .right: return NSLayoutConstraint.Attribute.right
        case .centerY: return NSLayoutConstraint.Attribute.centerY
        case .centerX: return NSLayoutConstraint.Attribute.centerX
        case .width: return NSLayoutConstraint.Attribute.width
        case .height: return NSLayoutConstraint.Attribute.height
        }
    }
}

public enum ConstraintType {
    case top(YAxis,Inset = 0)
    case left(XAxis,Inset = 0)
    case bottom(YAxis,Inset = 0)
    case right(XAxis,Inset = 0)
    case centerY(YAxis,Inset = 0)
    case centerX(XAxis,Inset = 0)
    case center(UIView, x: Inset = 0, y: Inset = 0)
    case width(Constant)
    case height(Constant)
}

public enum DirectionType {
    case top(Inset)
    case left(Inset)
    case bottom(Inset)
    case right(Inset)
    case width
    case height
}



