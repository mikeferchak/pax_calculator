//
//  SccaClass.swift
//  PAX
//
//  Created by Michael Ferchak on 6/22/15.
//  Copyright © 2015 Michael Ferchak. All rights reserved.
//

import Foundation

class Scca {
  let sccaclasses = [
    "Street":[
        "SS": 0.835,
        "AS": 0.833,
        "BS": 0.826,
        "CS": 0.819,
        "DS": 0.811,
        "ES": 0.807,
        "FS": 0.814,
        "GS": 0.806,
        "HS": 0.798,
        "HCS": 0.817],
    "Street touring":[
        "STF": 0.809,
        "STS": 0.832,
        "STX": 0.836,
        "STU": 0.845,
        "STR": 0.841,
        "STP": 0.837],
    "Street modified":[
        "SMF": 0.861,
        "SSM": 0.882,
        "SM": 0.87],
    "Street prepared":[
        "SSP": 0.872,
        "ASP": 0.865,
        "BSP": 0.863,
        "CSP": 0.867,
        "DSP": 0.855,
        "ESP": 0.852,
        "FSP": 0.84],
    "Prepared":[
        "XP": 0.907,
        "BP": 0.883,
        "CP": 0.864,
        "DP": 0.879,
        "EP": 0.871,
        "FP": 0.880,
        "HCR": 0.838],
    "Modified":[
        "AM": 1.000,
        "BM": 0.966,
        "CM": 0.916,
        "DM": 0.919,
        "EM": 0.920,
        "FM": 0.926,
        "KM": 0.95,
        "FSAE": 0.982],
    "Other":[
        "SSR": 0.860,
        "CAM-C": 0.839,
        "CAM-T": 0.834,
        "CAM-S": 0.848,
        "JA": 0.878,
        "JB": 0.842,
        "JC": 0.734]
    ]
  
    func categories() -> [String] {
        return Array(sccaclasses.keys)
    }
  
    func paxes() -> [String:Double] {
        var all = Dictionary<String, Double>()
        for item in sccaclasses {
            for sccaclass in item.1 {
                all[sccaclass.0] = sccaclass.1
            }
        }
        return all
    }
    
    func class_names() -> [String] {
        return Array(paxes().keys).sort()
    }

    func class_name_at_index(index:Int) -> String {
        return class_names()[index]
    }
    
    func pax_at_index(index:Int) -> Double {
        return paxes()[class_name_at_index(index) as String]!
    }
}
