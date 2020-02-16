//
//  UILab
//
//  Created on 16.02.2020.
//  Using Swift 5.0
//

import Foundation

internal class UILabLogger {
    internal enum LogStatus: String {
        case notice = "✅"
        case warning = "⚠️"
        case error = "❗️"
        case unknown = "none"
    }
    
    internal func notice(_ log: Log, debug:Bool) {
        perform(log, status: .notice, debug: debug)
    }
    
    internal func warning(_ log: Log, debug:Bool) {
        perform(log, status: .warning, debug: debug)
    }
    
    internal func error(_ log: Log, debug:Bool) {
        perform(log, status: .error, debug: debug)
    }
    
    internal func unknown(_ log: Log, debug:Bool) {
        perform(log, status: .unknown, debug: debug)
    }
    
    private func perform(_ log: Log, status: LogStatus, debug: Bool) {
        if !debug { return }
        var log = log
        log.status = status

        print("--------------")
        print(log.description)
        print()
    }
}
