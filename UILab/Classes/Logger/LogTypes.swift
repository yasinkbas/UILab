//
//  UILab
//
//  Created on 16.02.2020.
//  Using Swift 5.0
//

import Foundation

internal struct ConstraintLog: Log {
    var status: UILabLogger.LogStatus = .unknown
    
    let verboseName: String
    let messages: [String]
    let constraint: Constraint?
    var description: String {
        return """
        verbose_name: \(self.verboseName)
        status: \(self.status.rawValue)
        \(self.messages.joined(separator: "\n"))
        constraint: \(String(describing: constraint?.description))
        """
    }
}

internal protocol Log: CustomStringConvertible {
    var status: UILabLogger.LogStatus { get set }
}
