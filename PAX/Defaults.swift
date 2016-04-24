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
        thisPaxPicker = defaults.integerForKey("this_pax")
        thatPaxPicker = defaults.integerForKey("that_pax")
        thisTime = defaults.doubleForKey("this_time")
    }
    
    func set(thisTimeNew:Double, thisPaxPickerNew:Int, thatPaxPickerNew:Int) {
        defaults.setDouble(thisTimeNew, forKey: "this_time")
        defaults.setInteger(thisPaxPickerNew, forKey: "this_pax")
        defaults.setInteger(thatPaxPickerNew, forKey: "that_pax")
    }
}