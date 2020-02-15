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
    
    internal func notice(message: String, constraint: Constraint?, debug:Bool) {
        perform(type: .notice, message: message, constraint: constraint, debug: debug)
    }
    
    internal func warning(message: String, constraint: Constraint?, debug:Bool) {
        perform(type: .warning, message: message, constraint: constraint, debug: debug)
    }
    
    internal func error(message: String, constraint: Constraint?, debug:Bool) {
        perform(type: .error, message: message, constraint: constraint, debug: debug)
    }
    
    private func perform(type: LogType, message: String, constraint: Constraint?, debug: Bool) {
        if !debug { return }
        print("\(type.rawValue) -> \(message)")
        if let constraint = constraint {
            print(constraint)
        }
    }
}
