//
//  ConstraintsLogger.swift
//  UILab
//
//  Created by Yasin Akbaş on 12.02.2020.
//

import Foundation

internal class UILabLogger {
    internal enum LogType: String {
        case notice = "✅"
        case warning = "⚠️"
        case error = "❗️"
    }
    
    internal func notice(_ log: ConstraintLog, debug:Bool) {
        
        perform(log, type: .notice, debug: debug)
    }
    
    internal func warning(_ log: ConstraintLog, debug:Bool) {
        perform(log, type: .warning, debug: debug)
    }
    
    internal func error(_ log: ConstraintLog, debug:Bool) {
        perform(log, type: .error, debug: debug)
    }
    
    private func perform(_ log: ConstraintLog, type: LogType, debug: Bool) {
        if !debug { return }
        
        print("""
            --------------
            verbose_name: \(log.verboseName)
            status: \(type.rawValue)
            \(log.messages.joined(separator: "\n"))\n
            """)
        if let constraint = log.constraint {
            print(constraint)
        }
    }
}
