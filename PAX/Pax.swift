//
//  Pax.swift
//  PAX
//
//  Created by Mike Ferchak on 4/24/16.
//  Copyright © 2016 Michael Ferchak. All rights reserved.
//

import Foundation

class Pax {
    var paxClass = String()
    var paxIndex = Double()
    var pickerIndex = Int()
    
    init(index:Int) {
        paxClass = Scca().class_name_at_index(index)
        paxIndex = Scca().pax_at_index(index)
        pickerIndex = index
    }
}
