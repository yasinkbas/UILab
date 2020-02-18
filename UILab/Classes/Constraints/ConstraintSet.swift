//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import UIKit

extension UIView {
    @discardableResult
    public func set(_ constraintList: ConstraintType..., commit: Bool = true) -> Constraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        var _anchor: Any? = nil
        var _assign1: Any? = nil
        var _assign2: Any? = nil
        
        func setPoint(_ anchor: Any?, _ assign1: Any?, _ assign2: Any?, constraint: Constraint?) {
            _anchor = anchor
            _assign1 = assign1
            _assign2 = assign2
            
            ConstraintLog(verboseName: self.verboseName, messages: [.listened(anchor, assign1, assign2)], constraint: constraint)
                .commit(.notice)
        }
        
        var constraints = Constraints()
        constraintList.forEach{
            switch $0 {
            case .left(let anchor, let inset):
                constraints.append(self.leftAnchor.constraint(equalTo: anchor, constant: inset))
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .leftOf(let view, let inset):
                constraints.append(self.left.constraint(equalTo: view.left, constant: inset))
                setPoint(view, inset, nil, constraint: self.constraints.last)
                
            case .right(let anchor, let inset):
                constraints.append(self.rightAnchor.constraint(equalTo: anchor, constant: -inset))
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .top(let anchor, let inset):
                constraints.append(self.topAnchor.constraint(equalTo: anchor, constant: inset))
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .bottom(let anchor, let inset):
                constraints.append(self.bottomAnchor.constraint(equalTo: anchor, constant: -inset))
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .leading(let anchor, let inset):
                constraints.append(self.leading.constraint(equalTo: anchor, constant: inset))
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .trailing(let anchor, let inset):
                constraints.append(self.trailing.constraint(equalTo: anchor, constant: inset))
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .width(let width):
                constraints.append(self.widthAnchor.constraint(equalToConstant: width))
                setPoint(nil, width, nil, constraint: self.constraints.last)
                
            case .height(let height):
                constraints.append(self.heightAnchor.constraint(equalToConstant: height))
                setPoint(nil, height, nil, constraint: self.constraints.last)
                
            case .centerX(let anchor, let inset):
                constraints.append(self.centerXAnchor.constraint(equalTo: anchor, constant: inset))
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .centerY(let anchor, let inset):
                constraints.append(self.centerYAnchor.constraint(equalTo: anchor, constant: inset))
                setPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .widthDimension(let dimension, let multiple, let inset):
                constraints.append(self.width.constraint(equalTo: dimension, multiplier: multiple, constant: inset))
                setPoint(dimension, multiple, inset, constraint: self.constraints.last)
                
            case .heightDimension(let dimension, let multiple, let inset):
                constraints.append(self.height.constraint(equalTo: dimension, multiplier: multiple, constant: inset))
                setPoint(dimension, multiple, inset, constraint: self.constraints.last)
                
            case .center(let view, x: let xInset, y: let yInset):
                constraints.append(self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xInset))
                setPoint(view, xInset, yInset, constraint: self.constraints.last)
                constraints.append(self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yInset))
                setPoint(view, xInset, yInset, constraint: self.constraints.last)
            }
        }
        
        constraints.commit = commit
        return constraints
    }
}

