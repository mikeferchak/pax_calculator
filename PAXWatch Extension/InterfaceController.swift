//
//  InterfaceController.swift
//  PAXWatch Extension
//
//  Created by Mike Ferchak on 3/1/19.
//  Copyright © 2019 Michael Ferchak. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var thatTimeLabel: WKInterfaceLabel!
    @IBOutlet weak var thisClassLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        let defaults = Defaults()
        
//        let thisPaxIndex = Scca().pax_at_index(defaults.thisPaxPicker)
//        let thatPaxIndex = Scca().pax_at_index(defaults.thatPaxPicker)
//        
//        
//        let thatTime:Double = Calculator(this_time: defaults.thisTime, this_pax: thisPaxIndex, that_pax: thatPaxIndex).result
//        
//        let thatTimeString = String(thatTime)
//        let thatClassString = Scca().class_name_at_index(defaults.thatPaxPicker)
//        
//        thatTimeLabel.setText(thatTimeString)
//        thisClassLabel.setText(thatClassString)
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
