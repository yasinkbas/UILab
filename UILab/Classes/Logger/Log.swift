//
//  Log.swift
//  UILab
//
//  Created by Yasin Akbaş on 16.02.2020.
//

import Foundation

struct ConstraintLog: LogProtocol {
    let verboseName: String
    let messages: [String]
    let constraint: Constraint?
}


protocol LogProtocol {}
