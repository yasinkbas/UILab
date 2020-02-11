//
//  Constraints.swift
//  FBSnapshotTestCase
//
//  Created by Yasin Akbaş on 10.02.2020.
//

extension UIView {
    public var top: YAxis { return self.topAnchor }
    public var left: XAxis { return self.leftAnchor }
    public var leading: XAxis { return self.leadingAnchor }
    public var bottom: YAxis { return self.bottomAnchor }
    public var right: XAxis { return self.rightAnchor }
    
    public var superCenterY: YAxis? { return superview?.centerYAnchor }
    public var superCenterX: XAxis? { return superview!.centerXAnchor }
    public var superTop: YAxis? { return superview?.top }
    public var superLeft: XAxis? { return superview?.left }
    public var superLeading: XAxis? { return superview?.leading }
    public var superBottom: YAxis? { return superview?.bottomAnchor }
    public var superRight: XAxis? { return superview?.rightAnchor }
    public var superTrailing: XAxis? { return superview?.trailingAnchor }
}

extension UIView {    
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
    
    public func get(_ type: RawConstraintType) -> Constraints {
        print("i am in")
        return self.constraints.filter {
            print("found one -> ", $0.firstAttribute, "type: ", type.constraint)
            return $0.firstAttribute == type.constraint
        }
    }
}

