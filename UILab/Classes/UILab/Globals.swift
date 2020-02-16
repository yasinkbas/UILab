//
//  Globals.swift
//  UILab
//
//  Created by Yasin Akbaş on 12.02.2020.
//

import Foundation

var debug = UILab.Settings.debug {
    didSet {
        logger = debug ? UILabLogger() : nil
    }
}
var logger: UILabLogger? = UILabLogger()

struct Constants {
    static var debugKey = "UILab_debug"
}
