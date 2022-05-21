//
//  File.swift
//  
//
//  Created by Yasin Akbas on 22.05.2022.
//

@resultBuilder
public struct ConstraintBuilder {
    static public func buildBlock(_ components: ConstraintType...) -> [ConstraintType] {
        components
    }
}
