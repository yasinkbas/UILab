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
        
        func apppoint(_ anchor: Any?, _ assign1: Any?, _ assign2: Any?) {
            _anchor = anchor
            _assign1 = assign1
            _assign2 = assign2
            
            logger.notice(
                ConstraintLog(
                    verboseName: self.verboseName,
                    messages: ["listened log: \(anchor ?? "") \(assign1 ?? "") \(assign2 ?? "")"],
                    constraint: nil),
                debug: debug
            )
        }
        
        constraints.forEach{
            switch $0 {
            case .left(let anchor, let inset):
                apppoint(anchor, inset, nil)
                print()
                self.leftAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .right(let anchor, let inset):
                apppoint(anchor, inset, nil)
                self.rightAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
                
            case .top(let anchor, let inset):
                apppoint(anchor, inset, nil)
                self.topAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .bottom(let anchor, let inset):
                apppoint(anchor, inset, nil)
                self.bottomAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
                
            case .leading(let anchor, let inset):
                apppoint(anchor, inset, nil)
                self.leading.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .trailing(let anchor, let inset):
                apppoint(anchor, inset, nil)
                self.trailing.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .width(let width):
                apppoint(nil, width, nil)
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
                
            case .height(let height):
                apppoint(nil, height, nil)
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
                
            case .centerX(let anchor, let inset):
                apppoint(anchor, inset, nil)
                self.centerXAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .centerY(let anchor, let inset):
                apppoint(anchor, inset, nil)
                self.centerYAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .widthDimension(let dimension, let multiple, let inset):
                apppoint(dimension, multiple, inset)
                self.width.constraint(equalTo: dimension, multiplier: multiple, constant: inset).isActive = true
                
            case .heightDimension(let dimension, let multiple, let inset):
                apppoint(dimension, multiple, inset)
                self.height.constraint(equalTo: dimension, multiplier: multiple, constant: inset).isActive = true
                
            case .center(let view, x: let xInset, y: let yInset):
                apppoint(view, xInset, yInset)
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xInset).isActive = true
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yInset).isActive = true
            }
        }
    }
    
    public func get(_ attribute: Attribute) -> Constraints {
        var constraints = [NSLayoutConstraint]()
        self.constraints.forEach { $0.firstAttribute == attribute ? constraints.append($0) : nil }
        return constraints
    }
}

