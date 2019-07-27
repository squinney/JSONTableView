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
