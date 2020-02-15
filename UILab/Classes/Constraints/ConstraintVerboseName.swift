//
//  ConstraintVerboseName.swift
//  FBSnapshotTestCase
//
//  Created by Yasin Akbaş on 15.02.2020.
//

import UIKit

extension UIView {
    struct AssociatedKeys {
        static var verboseState: UInt8 = 0
    }
    
    public var verboseName: String {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.verboseState) as? String else {
                return "Unknown Object"
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.verboseState, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.constraints.last?.identifier = "\(newValue).\(String(describing: self.constraints.last?.firstAttribute))"
        }
    }
}
