//
//  SccaClass.swift
//  PAX
//
//  Created by Michael Ferchak on 6/22/15.
//  Copyright © 2015 Michael Ferchak. All rights reserved.
//

import Foundation

class Scca {
    var categories = [String]()
    var paxes = [String:Double]()
    var classNames = [String]()
    
    let sccaclasses = [
        "Street":[
            "SS": 0.823,
            "AS": 0.821,
            "BS": 0.814,
            "CS": 0.809,
            "DS": 0.807,
            "ES": 0.793,
            "FS": 0.806,
            "GS": 0.794,
            "HS": 0.782,
            "HCS": 0.795,
            "SSC": 0.812],
        "Street touring":[
            "STS": 0.811,
            "STX": 0.816,
            "STR": 0.827,
            "STU": 0.828,
            "STH": 0.813],
        "Street modified":[
            "SMF": 0.841,
            "SSM": 0.875,
            "SM": 0.856],
        "Street prepared":[
            "SSP": 0.853,
            "ASP": 0.849,
            "BSP": 0.852,
            "CSP": 0.865,
            "DSP": 0.842,
            "ESP": 0.839,
            "FSP": 0.825],
        "Prepared":[
            "XP": 0.882,
            "BP": 0.867,
            "CP": 0.851,
            "DP": 0.866,
            "EP": 0.850,
            "FP": 0.871,
            "HCR": 0.815],
        "Modified":[
            "AM": 1.000,
            "BM": 0.962,
            "CM": 0.893,
            "DM": 0.895,
            "EM": 0.898,
            "FM": 0.911,
            "KM": 0.930,
            "FSAE": 0.963],
        "Other":[
            "SSR": 0.843,
            "CAM-C": 0.818,
            "CAM-T": 0.817,
            "CAM-S": 0.835,
            "JA": 0.855,
            "JB": 0.820,
            "JC": 0.718,
            "XS-A": 0.846,
            "XS-B": 0.858,
            "EV": 0.826,
        ]
    ]

    
    init() {
        for item in sccaclasses {
            for sccaclass in item.1 {
                paxes[sccaclass.0] = sccaclass.1
            }
        }
        categories = Array(sccaclasses.keys)
        classNames = Array(paxes.keys).sorted()
    }
  
    func class_name_at_index(_ index:Int) -> String {
        return classNames[index]
    }
    
    func pax_at_index(_ index:Int) -> Double {
        return paxes[class_name_at_index(index) as String]!
    }
}
