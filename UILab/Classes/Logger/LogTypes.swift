//
//  UILab
//
//  Created on 16.02.2020.
//  Using Swift 5.0
//

import Foundation

internal protocol Log: CustomStringConvertible {
    var status: UILabLogger.LogStatus { get set }
}

internal protocol MessagePolicy: CustomStringConvertible {}

