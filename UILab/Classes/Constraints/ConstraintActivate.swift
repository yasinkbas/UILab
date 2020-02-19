//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import UIKit

extension UIView {
    @discardableResult
    internal func activate(_ wrapper: ConstraintWrapper, commit: Bool = true, priority: UILayoutPriority ) -> Constraints {
        ConstraintLog(verboseName: self.verboseName, messages: [.display(wrapper: wrapper)], constraint: nil).commit(.notice)
        
        let padding = wrapper.padding ?? .zero
        var topInset = Inset(0)
        var bottomInset = Inset(0)
        var leftInset = Inset(0)
        var rightInset = Inset(0)
        var constraints = Constraints()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11, *), wrapper.enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
            leftInset = insets.left
            rightInset = insets.right
        }
        
        if let top = wrapper.axises.top {
            constraints.append(self.topAnchor.constraint(equalTo: top, constant: padding.top+topInset))
        }
        if let left = wrapper.axises.left {
            constraints.append(self.leftAnchor.constraint(equalTo: left, constant: padding.left+leftInset))
        }
        if let right = wrapper.axises.right {
            constraints.append(rightAnchor.constraint(equalTo: right, constant: -padding.right-rightInset))
        }
        if let bottom = wrapper.axises.bottom {
            constraints.append(bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom-bottomInset))
        }
        if wrapper.height != 0 {
            constraints.append(heightAnchor.constraint(equalToConstant: wrapper.height))
        }
        if wrapper.width != 0 {
            constraints.append(widthAnchor.constraint(equalToConstant: wrapper.width))
        }
        
        constraints.priority = priority
        constraints.commit = commit
        return constraints
    }
}
