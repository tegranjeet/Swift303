//
//  Person.swift
//  Swift303
//
//  Created by Eric Armstrong on 8/6/19.
//  Copyright © 2019 Eric Armstrong. All rights reserved.
//

import Foundation

struct Person: Codable {
    let fname, lname, city: String
}

typealias People = [Person]
