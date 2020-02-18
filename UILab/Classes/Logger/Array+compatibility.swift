//
//  UILab
//
//  Created on 17.02.2020.
//  Using Swift 5.0
//

import Foundation

extension Array where Element == ConstraintLog.Message {
    func joined(_ seperator: String) -> String {
        return self.map{ $0.description }.joined(separator: seperator)
    }
}
