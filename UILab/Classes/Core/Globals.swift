//
//  UILab
//
//  Created on 12.02.2020.
//  Using Swift 5.0
//
import Foundation

var debug = UILab.Settings.debugMonitoringType {
    didSet {
        logger = (debug == .none ? nil : UILabLogger())
    }
}

var logger: UILabLogger? = UILabLogger()
