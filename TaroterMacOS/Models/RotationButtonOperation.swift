//
//  RotationButtonOperation.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 10/01/2022.
//

import Foundation

/// An type of operation performed during card rotation
/// - Addition: sums the current rotation degree and specified value
/// - Subtraction: subtracts the specified value from current rotation degree
enum RotationButtonOperation {
    case addition
    case subtraction
}
