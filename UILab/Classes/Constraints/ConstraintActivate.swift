//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import UIKit

extension UIView {
    internal func activate(_ wrapper: ConstraintWrapper) {
        logger?.notice(
            ConstraintLog(
                verboseName: self.verboseName,
                messages: [
                    .display(
                        axises: wrapper.axises,
                        padding: wrapper.padding,
                        width: wrapper.width,
                        height: wrapper.height,
                        enableInsets: wrapper.enableInsets
                    )
            ],constraint: nil),
            debug: debug
        )
        let padding = wrapper.padding ?? Padding.zero
        var topInset = Inset(0)
        var bottomInset = Inset(0)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11, *), wrapper.enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }
        
        if let top = wrapper.axises.top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top+topInset).isActive = true
        }
        if let left = wrapper.axises.left {
            self.leftAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        if let right = wrapper.axises.right {
            rightAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        if let bottom = wrapper.axises.bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom-bottomInset).isActive = true
        }
        if wrapper.height != 0 {
            heightAnchor.constraint(equalToConstant: wrapper.height).isActive = true
        }
        if wrapper.width != 0 {
            widthAnchor.constraint(equalToConstant: wrapper.width).isActive = true
        }
    }
}
