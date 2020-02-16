//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import UIKit

extension UIView {    
    public func set(_ constraints: ConstraintType...) {
        self.translatesAutoresizingMaskIntoConstraints = false
        var _anchor: Any? = nil
        var _assign1: Any? = nil
        var _assign2: Any? = nil
        
        func setPoint(_ anchor: Any?, _ assign1: Any?, _ assign2: Any?, constraint: Constraint?) {
            _anchor = anchor
            _assign1 = assign1
            _assign2 = assign2
            
            logger?.notice(
                ConstraintLog(
                    verboseName: self.verboseName,
                    messages: ["listened log: \(anchor ?? "") \(assign1 ?? "") \(assign2 ?? "")"],
                    constraint: constraint),
                debug: debug
            )
        }
        
        constraints.forEach{
            switch $0 {
            case .left(let anchor, let inset):
                self.leftAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .leftOf(let view, let inset):
                self.left.constraint(equalTo: view.left, constant: inset).isActive = true
                setPoint(view, inset, nil, constraint: self.constraints.last)
                
            case .right(let anchor, let inset):
                self.rightAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .top(let anchor, let inset):
                self.topAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .bottom(let anchor, let inset):
                self.bottomAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .leading(let anchor, let inset):
                self.leading.constraint(equalTo: anchor, constant: inset).isActive = true
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .trailing(let anchor, let inset):
                self.trailing.constraint(equalTo: anchor, constant: inset).isActive = true
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .width(let width):
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
                setPoint(nil, width, nil, constraint: self.constraints.last)
                
            case .height(let height):
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
                setPoint(nil, height, nil, constraint: self.constraints.last)
                
            case .centerX(let anchor, let inset):
                self.centerXAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .centerY(let anchor, let inset):
                self.centerYAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .widthDimension(let dimension, let multiple, let inset):
                self.width.constraint(equalTo: dimension, multiplier: multiple, constant: inset).isActive = true
                setPoint(dimension, multiple, inset, constraint: self.constraints.last)
                
            case .heightDimension(let dimension, let multiple, let inset):
                self.height.constraint(equalTo: dimension, multiplier: multiple, constant: inset).isActive = true
                setPoint(dimension, multiple, inset, constraint: self.constraints.last)
                
            case .center(let view, x: let xInset, y: let yInset):
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xInset).isActive = true
                setPoint(view, xInset, yInset, constraint: self.constraints.last)
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yInset).isActive = true
                setPoint(view, xInset, yInset, constraint: self.constraints.last)
            }
        }
    }
}

