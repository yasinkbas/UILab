//
//  ConstraintGet.swift
//  UILab
//
//  Created by Yasin Akbaş on 16.02.2020.
//

import UIKit

extension UIView {
    public func get(_ attribute: Attribute) -> Constraints {
        var constraints = [NSLayoutConstraint]()
        self.constraints.forEach { $0.firstAttribute == attribute ? constraints.append($0) : nil }
        return constraints
    }
}
