//
//  Constraints.swift
//  UILab
//
//  Created by Yasin Akbaş on 10.02.2020.
//b

extension UIView {    
    public func set(_ constraints: ConstraintType...) {
        self.translatesAutoresizingMaskIntoConstraints = false
        var _anchor: Any? = nil
        var _assign1: Any? = nil
        var _assign2: Any? = nil
        
        func logPoint(_ anchor: Any?, _ assign1: Any?, _ assign2: Any?, constraint: Constraint?) {
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
                logPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .right(let anchor, let inset):
                self.rightAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
                logPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .top(let anchor, let inset):
                self.topAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                logPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .bottom(let anchor, let inset):
                self.bottomAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
                logPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .leading(let anchor, let inset):
                self.leading.constraint(equalTo: anchor, constant: inset).isActive = true
                logPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .trailing(let anchor, let inset):
                self.trailing.constraint(equalTo: anchor, constant: inset).isActive = true
                logPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .width(let width):
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
                logPoint(nil, width, nil, constraint: self.constraints.last)
                
            case .height(let height):
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
                logPoint(nil, height, nil, constraint: self.constraints.last)
                
            case .centerX(let anchor, let inset):
                self.centerXAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                logPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .centerY(let anchor, let inset):
                self.centerYAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                logPoint(anchor, inset, nil, constraint: self.constraints.last)
                
            case .widthDimension(let dimension, let multiple, let inset):
                self.width.constraint(equalTo: dimension, multiplier: multiple, constant: inset).isActive = true
                logPoint(dimension, multiple, inset, constraint: self.constraints.last)
                
            case .heightDimension(let dimension, let multiple, let inset):
                self.height.constraint(equalTo: dimension, multiplier: multiple, constant: inset).isActive = true
                logPoint(dimension, multiple, inset, constraint: self.constraints.last)
                
            case .center(let view, x: let xInset, y: let yInset):
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xInset).isActive = true
                logPoint(view, xInset, yInset, constraint: self.constraints.last)
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yInset).isActive = true
                logPoint(view, xInset, yInset, constraint: self.constraints.last)
            }
        }
    }
    
    public func get(_ attribute: Attribute) -> Constraints {
        var constraints = [NSLayoutConstraint]()
        self.constraints.forEach { $0.firstAttribute == attribute ? constraints.append($0) : nil }
        return constraints
    }
}

