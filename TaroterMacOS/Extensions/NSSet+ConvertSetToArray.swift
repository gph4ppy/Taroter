//
//  NSSet+ConvertSetToArray.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 02/01/2022.
//

import Foundation

extension NSSet {
    /// This method converts the NSSet to an array.
    /// - Returns: An array of specified type.
    func toArray<T>(_ of: T.Type) -> [T] {
        let array = self.map({$0 as! T})
        return array
    }
}
