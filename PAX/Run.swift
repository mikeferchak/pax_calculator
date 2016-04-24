//
//  Run.swift
//  PAX
//
//  Created by Mike Ferchak on 4/24/16.
//  Copyright © 2016 Michael Ferchak. All rights reserved.
//

import Foundation
import UIKit

class Run {
    var time = Double()
    var pax = Pax(index: 0)
    
    init(dblTime:Double, pickerIndex:Int) {
        pax = Pax(index: pickerIndex)
        time = dblTime
    }
    
    init?(strTime:String, pickerIndex:Int) {
        if let _time = Double(strTime) {
            pax = Pax(index: pickerIndex)
            time = _time
        } else {
            return nil
        }
    }
    
    init?(txtFieldTime:UITextField, pickerIndex:Int) {
        if let _time = Double(txtFieldTime.text!) {
            pax = Pax(index: pickerIndex)
            time = _time
        } else {
            return nil
        }
    }
    
    init(calculateFrom:Double, thisPickerIndex:Int, thisPaxIndex:Double, thatPaxIndex:Double) {
        pax = Pax(index: thisPickerIndex)
        time = Calculator(this_time: calculateFrom, this_pax: thisPaxIndex, that_pax: thatPaxIndex).result
    }
}
