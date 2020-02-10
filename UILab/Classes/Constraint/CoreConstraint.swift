//
//  CoreConstraint.swift
//  FBSnapshotTestCase
//
//  Created by Yasin Akbaş on 10.02.2020.
//

import Foundation

extension UIView {
    internal func activate(
        top: YAxis? = nil,
        left: XAxis? = nil,
        bottom: YAxis? = nil,
        right: XAxis? = nil,
        paddingTop: Inset = 0.0,
        paddingLeft: Inset = 0.0,
        paddingBottom: Inset = 0.0,
        paddingRight: Inset = 0.0,
        width: Constant = 0,
        height: Constant = 0,
        enableInsets: Bool = true
    ) {
        var topInset = Inset(0)
        var bottomInset = Inset(0)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
