//
//  EnumTypes.swift
//  UILab
//
//  Created by Yasin Akbaş on 11.02.2020.
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

public enum ConstraintType {
    case left               (XAxis,Inset = 0)
    case right              (XAxis,Inset = 0)
    case top                (YAxis,Inset = 0)
    case bottom             (YAxis,Inset = 0)
    case leading            (XAxis, Inset = 0)
    case trailing           (XAxis, Inset = 0)
    case width              (Constant)
    case height             (Constant)
    case centerX            (XAxis,Inset = 0)
    case centerY            (YAxis,Inset = 0)
    case center             (UIView, x: Inset = 0, y: Inset = 0)
    case widthDimension     (Dimension, Multiple = 1, Inset = 0)
    case heightDimension    (Dimension, Multiple = 1, Inset = 0)
}

public enum ConstraintDirectionType {
    case top                (Inset)
    case left               (Inset)
    case bottom             (Inset)
    case right              (Inset)
    case width
    case height
}
