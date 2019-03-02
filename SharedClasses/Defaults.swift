//
//  Defaults.swift
//  PAX
//
//  Created by Mike Ferchak on 4/24/16.
//  Copyright © 2016 Michael Ferchak. All rights reserved.
//

import Foundation

class Defaults {
    let defaults = UserDefaults.standard
    var thisTime = Double()
    var thisPaxPicker = Int()
    var thatPaxPicker = Int()
    
    init() {
        thisTime = defaults.double(forKey: "PAX_thisTime")
        thisPaxPicker = defaults.integer(forKey: "PAX_thisPickerIndex")
        thatPaxPicker = defaults.integer(forKey: "PAX_thatPickerIndex")
    }
    
    func set(_ thisTimeNew:Double, thisPaxPickerNew:Int, thatPaxPickerNew:Int) {
        defaults.set(thisTimeNew, forKey: "PAX_thisTime")
        defaults.set(thisPaxPickerNew, forKey: "PAX_thisPickerIndex")
        defaults.set(thatPaxPickerNew, forKey: "PAX_thatPickerIndex")
    }
}
