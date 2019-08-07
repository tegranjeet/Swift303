//
//  UITableViewExtensions.swift
//  Swift303
//
//  Created by Eric Armstrong on 8/6/19.
//  Copyright © 2019 Eric Armstrong. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableIdentifier {
}

extension ReusableIdentifier {
    
    static var reuseIdentifier: String {
        return String(describing: type(of: self))
    }
}

extension UITableView {
    
    // ----------------------------------------------------------------------------
    // MARK: Convenience Methods
    // ----------------------------------------------------------------------------

    func registerCell(_ cell: ReusableIdentifier.Type) {
        register(cell as? AnyClass, forCellReuseIdentifier: cell.reuseIdentifier)
    }

    func dequeueCell<Cell: ReusableIdentifier>(at index: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: index) as? Cell else {
            preconditionFailure("Could not deque reusable table view cell.")
        }
        return cell
    }
}
