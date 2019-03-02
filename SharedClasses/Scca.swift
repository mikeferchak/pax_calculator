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
            "SS": 0.821,
            "AS": 0.817,
            "BS": 0.810,
            "CS": 0.809,
            "DS": 0.800,
            "ES": 0.789,
            "FS": 0.803,
            "GS": 0.788,
            "HS": 0.780,
            "HCS": 0.793,
            "SSC": 0.801],
        "Street touring":[
            "STS": 0.811,
            "STX": 0.815,
            "STR": 0.827,
            "STU": 0.828,
            "STH": 0.813],
        "Street modified":[
            "SMF": 0.841,
            "SSM": 0.875,
            "SM": 0.855],
        "Street prepared":[
            "SSP": 0.853,
            "ASP": 0.850,
            "BSP": 0.851,
            "CSP": 0.857,
            "DSP": 0.840,
            "ESP": 0.836,
            "FSP": 0.824],
        "Prepared":[
            "XP": 0.885,
            "BP": 0.865,
            "CP": 0.848,
            "DP": 0.858,
            "EP": 0.849,
            "FP": 0.863,
            "HCR": 0.814],
        "Modified":[
            "AM": 1.000,
            "BM": 0.960,
            "CM": 0.891,
            "DM": 0.895,
            "EM": 0.894,
            "FM": 0.907,
            "KM": 0.930,
            "FSAE": 0.962],
        "Other":[
            "SSR": 0.843,
            "CAM-C": 0.820,
            "CAM-T": 0.812,
            "CAM-S": 0.833,
            "JA": 0.856,
            "JB": 0.822,
            "JC": 0.718]
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
