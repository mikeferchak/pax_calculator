//
//  Calculator.swift
//  PAX
//
//  Created by Michael Ferchak on 6/22/15.
//  Copyright © 2015 Michael Ferchak. All rights reserved.
//

import Foundation

class Calculator {
    var result = Double()
    
    init(this_time:Double, this_pax:Double, that_pax:Double) {
        let calc = (this_time * this_pax) / that_pax
        result = round(1000 * calc) / 1000
    }
}