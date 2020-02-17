//
//  UILab
//
//  Created on 16.02.2020.
//  Using Swift 5.0
//

import Foundation

internal struct ConstraintLog: Log {
    internal enum Message: MessageAdvisable {
        var description: String {
            switch self {
            case .superviewNotFound:
                return "superview could not be found"
            case .listened(let anchor, let assign1, let assign2):
                return "listened log: \(anchor ?? "") \(assign1 ?? "") \(assign2 ?? "")"
            case .display(let axises, let padding, let width, let height, let enableInsets):
                return """
                axises: \(axises)
                padding: \(String(describing: padding))"
                width: \(width)
                height: \(height)
                enableInsets: \(enableInsets)
                """
            }
        }
        case superviewNotFound
        case listened(Any?, Any?, Any?)
        case display(
            axises: Axises,
            padding: Padding? = Padding.zero,
            width: Constant = 0,
            height: Constant = 0,
            enableInsets: Bool = true
        )
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

internal protocol MessageAdvisable: CustomStringConvertible {}

