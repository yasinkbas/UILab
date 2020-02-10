//
//  Constraints.swift
//  FBSnapshotTestCase
//
//  Created by Yasin Akbaş on 10.02.2020.
//

extension UIView {
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
    
    public var superCenterY: YAxis? {
        return superview?.centerYAnchor
    }
    
    public var superTop: YAxis? {
        return superview?.topAnchor
    }
    
    public var superBottom: YAxis? {
        return superview?.bottomAnchor
    }
    
    public var superCenterX: XAxis? {
        return superview!.centerXAnchor
    }
    
    public var superLeft: XAxis? {
        return superview?.leftAnchor
    }
    
    public var superRight: XAxis? {
        return superview?.rightAnchor
    }
    
    public func set(_ constraints: ConstraintType...) {
        self.translatesAutoresizingMaskIntoConstraints = false
        constraints.forEach{
            switch $0 {
            case .top(let anchor, let inset): self.topAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
            case .left(let anchor, let inset): self.leftAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
            case .bottom(let anchor, let inset): self.bottomAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
            case .right(let anchor, let inset): self.rightAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
            case .centerX(let anchor, let inset): self.centerXAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
            case .centerY(let anchor, let inset): self.centerYAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
            case .center(let view, x: let xInset, y: let yInset):
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xInset).isActive = true
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yInset).isActive = true
            case .width(let width):  self.widthAnchor.constraint(equalToConstant: width).isActive = true
            case .height(let height):  self.heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
    }
}
