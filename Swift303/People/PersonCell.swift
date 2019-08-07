//
//  PersonCell.swift
//  Swift303
//
//  Created by Eric Armstrong on 8/6/19.
//  Copyright © 2019 Eric Armstrong. All rights reserved.
//

import Foundation
import UIKit

class PersonCell: UITableViewCell, ReusableIdentifier {
    
    // ----------------------------------------------------------------------------
    // MARK: UITableViewCell
    // ----------------------------------------------------------------------------
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(style: .subtitle, reuseIdentifier: PersonCell.reuseIdentifier)
    }
    
    // ----------------------------------------------------------------------------
    // MARK: Internal
    // ----------------------------------------------------------------------------
    
    func updatePerson(_ person: Person) {
        textLabel?.text = person.fname + " " + person.lname
        detailTextLabel?.text = person.city
    }
}
