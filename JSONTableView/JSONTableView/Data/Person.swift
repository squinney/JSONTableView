//
//  Person.swift
//  JSONTableView
//
//  Created by Stephen Feuerstein on 7/27/19.
//  Copyright © 2019 Refactor Studios. All rights reserved.
//

import Foundation

struct Person {
    let fname: String
    let lname: String
    let city: String
}

extension Person: Codable {}

// MARK: - String Formatting

extension Person {
    /// Formatted string for the Person's name
    ///
    /// - Returns: Person's name in the format "{fname} {lname}"
    func formattedName() -> String {
        return "\(fname) \(lname)"
    }
}
