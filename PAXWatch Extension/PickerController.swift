//
//  PickerController.swift
//  PAXWatch Extension
//
//  Created by Mike Ferchak on 3/1/19.
//  Copyright © 2019 Michael Ferchak. All rights reserved.
//

import WatchKit
import Foundation

class PickerController: WKInterfaceController {
    @IBOutlet var secondsPicker: WKInterfacePicker!
    @IBOutlet var tenthsPicker: WKInterfacePicker!
    @IBOutlet var hundrethsPicker: WKInterfacePicker!
    @IBOutlet var thousandthsPicker: WKInterfacePicker!
    
    @IBOutlet var thisClassPicker: WKInterfacePicker!
    @IBOutlet var thatClassPicker: WKInterfacePicker!
    
    @IBOutlet weak var thatTimeLabel: WKInterfaceLabel!
    @IBOutlet weak var thatClassLabel: WKInterfaceLabel!
    
    var thisClassPickerValue = 0
    var thatClassPickerValue = 0
    var thisTime = 0.00
    var thisSeconds:Int = 0
    var thisTenths:Int = 0
    var thisHundreths:Int = 0
    var thisThousanths:Int = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        //var defaults = Defaults.init()
        
        setupSecondsPicker()
        setupTenthsPicker()
        setupHundrethsPicker()
        setupThousandthsPicker()
        
        setupThisClassPicker()
        setupThatClassPicker()
        
        applyDefaults()
        
        super.willActivate()
    }
    
    func applyDefaults() {
        let defaults = Defaults()
        
        thisClassPicker.setSelectedItemIndex(defaults.thisPaxPicker);
        thatClassPicker.setSelectedItemIndex(defaults.thatPaxPicker);
        
        let time = defaults.thisTime
        
        let seconds = modf(time).0
        
        let decimals = String(modf(time).1 * 1000)
        let decimalsTokenized = decimals.compactMap({Int(String($0))})
        
        if decimalsTokenized.count == 3 {
            let tenths = decimalsTokenized[0]
            let hundreths = decimalsTokenized[1]
            let thousandths = decimalsTokenized[2]
            
            secondsPicker.setSelectedItemIndex(Int(seconds))
            tenthsPicker.setSelectedItemIndex(tenths)
            hundrethsPicker.setSelectedItemIndex(hundreths)
            thousandthsPicker.setSelectedItemIndex(thousandths)
        }
        
        
     
        
        updateLabels()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setupSecondsPicker() {
        var pickerItems:[WKPickerItem] = []
        for i in stride(from: 0, to: 1000, by: 1) {
            let pickerItem = WKPickerItem()
            pickerItem.title = String(i)
            pickerItem.caption = "Seconds"
            pickerItems += [pickerItem]
        }
        
        secondsPicker.setItems(pickerItems)
    }
    
    func setupTenthsPicker() {
        var pickerItems:[WKPickerItem] = []
        for i in stride(from: 0, to: 10, by: 1) {
            let pickerItem = WKPickerItem()
            pickerItem.title = String(i)
            pickerItem.caption = "Tenths"
            pickerItems += [pickerItem]
        }
        
        tenthsPicker.setItems(pickerItems)
    }
    
    func setupHundrethsPicker() {
        var pickerItems:[WKPickerItem] = []
        for i in stride(from: 0, to: 10, by: 1) {
            let pickerItem = WKPickerItem()
            pickerItem.title = String(i)
            pickerItem.caption = "Hundreths"
            pickerItems += [pickerItem]
        }
        
        hundrethsPicker.setItems(pickerItems)
    }
    
    func setupThousandthsPicker() {
        var pickerItems:[WKPickerItem] = []
        for i in stride(from: 0, to: 10, by: 1) {
            let pickerItem = WKPickerItem()
            pickerItem.title = String(i)
            pickerItem.caption = "Thousandths"
            pickerItems += [pickerItem]
        }
        
        thousandthsPicker.setItems(pickerItems)
    }
    
    func setupThisClassPicker() {
        var pickerItems:[WKPickerItem] = []
        
        let classNames:[String] = Scca().classNames;
        
        for className in classNames {
            let pickerItem = WKPickerItem()
            pickerItem.title = className
            pickerItem.caption = className
            pickerItems += [pickerItem]
        }
        
        thisClassPicker.setItems(pickerItems)
    }
    
    func setupThatClassPicker() {
        var pickerItems:[WKPickerItem] = []

        let classNames:[String] = Scca().classNames;

        for className in classNames {
            let pickerItem = WKPickerItem()
            pickerItem.title = className
            pickerItem.caption = className
            pickerItems += [pickerItem]
        }

        thatClassPicker.setItems(pickerItems)
    }
    
    func calculateTime() -> Double {
        var result:Double = 0.0
        result += Double(thisSeconds)
        result += Double(thisTenths) / 10.0
        result += Double(thisHundreths) / 100.0
        result += Double(thisThousanths) / 1000.0
        
        return result
    }
    
    func updateLabels() {
        let thisPaxIndex = Scca().pax_at_index(thisClassPickerValue)
        let thatPaxIndex = Scca().pax_at_index(thatClassPickerValue)
        
        let thatTime:Double = Calculator(this_time: thisTime, this_pax: thisPaxIndex, that_pax: thatPaxIndex).result
        
        let thatTimeString = String(thatTime)
        let thatClassString = Scca().class_name_at_index(thatClassPickerValue)
        
        thatTimeLabel.setText(thatTimeString)
        thatClassLabel.setText(thatClassString)
    }
    
    @IBAction func secondsPickerChanged(_ value: Int) {
        thisSeconds = value
        thisTime = calculateTime()
        updateLabels()
        Defaults().set(thisTime, thisPaxPickerNew: thisClassPickerValue, thatPaxPickerNew: thatClassPickerValue)
    }

    @IBAction func tenthsPickerChanged(_ value: Int) {
        thisTenths = value
        thisTime = calculateTime()
        updateLabels()
        Defaults().set(thisTime, thisPaxPickerNew: thisClassPickerValue, thatPaxPickerNew: thatClassPickerValue)
    }
    
    @IBAction func hundrethsPickerChanged(_ value: Int) {
        thisHundreths = value
        thisTime = calculateTime()
        updateLabels()
        Defaults().set(thisTime, thisPaxPickerNew: thisClassPickerValue, thatPaxPickerNew: thatClassPickerValue)
    }
    
    @IBAction func thousandthsPickerChanged(_ value: Int) {
        thisThousanths = value
        thisTime = calculateTime()
        updateLabels()
        Defaults().set(thisTime, thisPaxPickerNew: thisClassPickerValue, thatPaxPickerNew: thatClassPickerValue)
    }
    
    @IBAction func thisClassPickerChanged(_ value: Int) {
        thisClassPickerValue = value
        updateLabels()
        Defaults().set(thisTime, thisPaxPickerNew: thisClassPickerValue, thatPaxPickerNew: thatClassPickerValue)
    }
    
    @IBAction func thatClassPickerChanged(_ value: Int) {
        thatClassPickerValue = value
        updateLabels()
        Defaults().set(thisTime, thisPaxPickerNew: thisClassPickerValue, thatPaxPickerNew: thatClassPickerValue)
    }
}
