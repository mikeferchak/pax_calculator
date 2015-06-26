//
//  SccaClass.swift
//  PAX
//
//  Created by Michael Ferchak on 6/22/15.
//  Copyright © 2015 Michael Ferchak. All rights reserved.
//

import Foundation

class Scca {
  let classes = [
    "Street":[
      "SSR": 0.859,
      "SS": 0.835,
      "AS": 0.829,
      "BS": 0.826,
      "CS": 0.814,
      "DS": 0.812,
      "ES": 0.808,
      "FS": 0.810,
      "GS": 0.806,
      "HS": 0.79],
    "Street touring":[
      "STF": 0.801,
      "STS": 0.828,
      "STX": 0.831,
      "STU": 0.844,
      "STR": 0.83],
    "Street modified":[
      "SMF": 0.853,
      "SSM": 0.882,
      "SM": 0.87],
    "Street prepared":[
      "SSP": 0.871,
      "ASP": 0.865,
      "BSP": 0.863,
      "CSP": 0.861,
      "DSP": 0.854,
      "ESP": 0.849,
      "FSP": 0.84],
    "Prepared":[
      "XP": 0.905,
      "BP": 0.881,
      "CP": 0.864,
      "DP": 0.879,
      "EP": 0.874,
      "FP": 0.88],
    "Modified":[
      "AM": 1.000,
      "BM": 0.964,
      "CM": 0.919,
      "DM": 0.918,
      "EM": 0.922,
      "FM": 0.926,
      "KM": 0.95],
    "Other":[
      "CAM-C": 0.830,
      "CAM-T": 0.825,
      "CAM-S": 0.836,
      "HC": 0.841,
      "FSAE": 0.984,
      "JA": 0.878,
      "JB": 0.842,
      "JC": 0.73]
  ]
  
    func categories() -> [String] {
        return Array(classes.keys)
    }
  
    func paxes() -> [String:Double] {
        var all = Dictionary<String, Double>()
        for item in classes {
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
