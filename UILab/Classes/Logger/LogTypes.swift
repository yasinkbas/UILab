//
//  UILab
//
//  Created on 16.02.2020.
//  Using Swift 5.0
//

import Foundation

internal struct ConstraintLog: Log {
    internal enum Message: MessagePolicy {
        var description: String {
            switch self {
            case .superviewNotFound:
                return "superview could not be found"
            case .listened(let anchor, let assign1, let assign2):
                return "listened log: \(anchor ?? "") \(assign1 ?? "") \(assign2 ?? "")"
            case .display(let wrapper):
                return """
                axises: \(wrapper.axises)
                padding: \(String(describing: wrapper.padding))"
                width: \(wrapper.width)
                height: \(wrapper.height)
                enableInsets: \(wrapper.enableInsets)
                """
            }
        }
        case superviewNotFound
        case listened(Any?, Any?, Any?)
        case display(wrapper: ConstraintWrapper)
    }
    
    var status: UILabLogger.LogStatus = .unknown
    
    let verboseName: String
    let messages: [Message]
    let constraint: Constraint?
    var description: String {
        return """
        verbose_name: \(self.verboseName)
        status: \(self.status.rawValue)
        \(self.messages.joined("\n"))
        constraint: \(String(describing: constraint?.description))
        """
    }
}

internal protocol Log: CustomStringConvertible {
    var status: UILabLogger.LogStatus { get set }
}

internal protocol MessagePolicy: CustomStringConvertible {}

