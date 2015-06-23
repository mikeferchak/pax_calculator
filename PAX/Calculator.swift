//
//  Calculator.swift
//  PAX
//
//  Created by Michael Ferchak on 6/22/15.
//  Copyright © 2015 Michael Ferchak. All rights reserved.
//

import Foundation

class Calculator {
    func calculate(this_time:Double, this_pax:Double, that_pax:Double) -> Double{
        return (this_time * this_pax) / that_pax
    }
}