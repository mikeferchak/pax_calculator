//
//  Defaults.swift
//  PAX
//
//  Created by Mike Ferchak on 4/24/16.
//  Copyright © 2016 Michael Ferchak. All rights reserved.
//

import Foundation

class Defaults {
    let defaults = NSUserDefaults.standardUserDefaults()
    var thisTime = Double()
    var thisPaxPicker = Int()
    var thatPaxPicker = Int()
    
    init() {
        thisTime = defaults.doubleForKey("PAX_thisTime")
        thisPaxPicker = defaults.integerForKey("PAX_thisPickerIndex")
        thatPaxPicker = defaults.integerForKey("PAX_thatPickerIndex")
    }
    
    func set(thisTimeNew:Double, thisPaxPickerNew:Int, thatPaxPickerNew:Int) {
        defaults.setDouble(thisTimeNew, forKey: "PAX_thisTime")
        defaults.setInteger(thisPaxPickerNew, forKey: "PAX_thisPickerIndex")
        defaults.setInteger(thatPaxPickerNew, forKey: "PAX_thatPickerIndex")
    }
}