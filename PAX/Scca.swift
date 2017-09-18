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
            "SS": 0.826,
            "AS": 0.819,
            "BS": 0.813,
            "CS": 0.810,
            "DS": 0.801,
            "ES": 0.794,
            "FS": 0.804,
            "GS": 0.793,
            "HS": 0.786,
            "HCS": 0.809],
        "Street touring":[
            "STF": 0.800,
            "STS": 0.818,
            "STX": 0.822,
            "STU": 0.831,
            "STR": 0.830,
            "STP": 0.820],
        "Street modified":[
            "SMF": 0.848,
            "SSM": 0.875,
            "SM": 0.861],
        "Street prepared":[
            "SSP": 0.862,
            "ASP": 0.856,
            "BSP": 0.853,
            "CSP": 0.860,
            "DSP": 0.842,
            "ESP": 0.837,
            "FSP": 0.829],
        "Prepared":[
            "XP": 0.892,
            "BP": 0.869,
            "CP": 0.854,
            "DP": 0.865,
            "EP": 0.859,
            "FP": 0.873,
            "HCR": 0.825],
        "Modified":[
            "AM": 1.000,
            "BM": 0.956,
            "CM": 0.901,
            "DM": 0.906,
            "EM": 0.905,
            "FM": 0.916,
            "KM": 0.939,
            "FSAE": 0.966],
        "Other":[
            "SSR": 0.847,
            "CAM-C": 0.823,
            "CAM-T": 0.817,
            "CAM-S": 0.838,
            "JA": 0.864,
            "JB": 0.834,
            "JC": 0.726]
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
