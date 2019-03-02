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
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        setupSecondsPicker()
        setupTenthsPicker()
        setupHundrethsPicker()
        setupThousandthsPicker()
        
        super.willActivate()
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
    
    
    
    @IBAction func secondsPickerChanged(_ value: Int) {
    }

    @IBAction func tenthsPickerChanged(_ value: Int) {
    }
    
    @IBAction func hundrethsPickerChanged(_ value: Int) {
    }
    
    @IBAction func thousandthsPickerChanged(_ value: Int) {
    }
}
