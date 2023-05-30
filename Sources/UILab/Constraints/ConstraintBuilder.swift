//
//  File.swift
//
//
//  Created by Yasin Akbas on 22.05.2022.
//

@resultBuilder
public enum ConstraintBuilder {
  public static func buildBlock(_ components: ConstraintType...) -> [ConstraintType] {
    components
  }
}
