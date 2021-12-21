//
//  UILab
//
//  Created on 12.02.2020.
//  Using Swift 5.0
//

import Foundation

internal class UILabLogger {
    internal enum LogStatus: String {
        case notice = "✅"
        case warning = "⚠️"
        case error = "❗️"
        case unknown = "unknown"
    }
    
    internal func notice(_ log: Log) {
        perform(log, status: .notice)
    }
    
    internal func warning(_ log: Log) {
        perform(log, status: .warning)
    }
    
    internal func error(_ log: Log) {
        perform(log, status: .error)
    }
    
    internal func unknown(_ log: Log) {
        perform(log, status: .unknown)
    }
    
    internal func commit(_ log: Log, type: LogStatus) {
        switch type {
            case .notice: notice(log)
            case .warning: warning(log)
            case .error: error(log)
            case .unknown: unknown(log)
        }
    }
    
    private func perform(_ log: Log, status: LogStatus) {
        if debug == .none ||
            debug == .import &&
            status == .notice { return }
        var log = log
        log.status = status
        
        print("--------------")
        print(log.description)
        print()
    }
}
