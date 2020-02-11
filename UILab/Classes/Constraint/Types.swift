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
    
    var constraint: NSLayoutAttribute {
        switch self {
        case.top:
            return NSLayoutAttribute.top
        case .left:
            return NSLayoutAttribute.left
        case .bottom:
            return NSLayoutAttribute.bottom
        case .right:
            return NSLayoutAttribute.right
        case .centerY:
            return NSLayoutAttribute.centerY
        case .centerX:
            return NSLayoutAttribute.centerX
        case .width:
            return NSLayoutAttribute.width
        case .height:
            return NSLayoutAttribute.height
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



