//
//  UILabelExtensions.swift
//  Swift303
//
//  Created by Eric Armstrong on 8/6/19.
//  Copyright © 2019 Eric Armstrong. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(configure: (UILabel) -> Void) {
        self.init()
        configure(self)
    }
}
