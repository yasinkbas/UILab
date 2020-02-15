//
//  CoreConstraint.swift
//  UILab
//
//  Created by Yasin Akbaş on 10.02.2020.
//

import Foundation

extension UIView {
    internal func activate(
        axises: Axises,
        padding: Padding? = Padding.zero,
        width: Constant = 0,
        height: Constant = 0,
        enableInsets: Bool = true
    ) {
        logger?.notice(
            ConstraintLog(
                verboseName: self.verboseName,
                messages: [
                    "axises: \(axises)",
                    "padding: \(padding!)",
                    "width: \(width)",
                    "height: \(height)",
                    "enableInsets: \(enableInsets)"
                ],constraint: nil),
            debug: debug
        )
        let padding = padding ?? Padding.zero
        var topInset = Inset(0)
        var bottomInset = Inset(0)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }
        
        if let top = axises.top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top+topInset).isActive = true
        }
        if let left = axises.left {
            self.leftAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        if let right = axises.right {
            rightAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        if let bottom = axises.bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
