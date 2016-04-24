//
//  ViewController.swift
//  PAX
//
//  Created by Michael Ferchak on 6/22/15.
//  Copyright © 2015 Michael Ferchak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    @IBOutlet var this_time:UITextField!
    @IBOutlet var this_time_more_info:UILabel!
    @IBOutlet var this_class_picker:UIPickerView!
    @IBOutlet var that_class_picker:UIPickerView!
    @IBOutlet var that_time:UILabel!
    @IBOutlet var that_time_more_info:UILabel!
    
    @IBAction func time_changed(sender: AnyObject) {
        recalculate()
    }
    
    let scca = Scca()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        this_class_picker.delegate = self
        that_class_picker.delegate = self
        
        applyDefaults()
        recalculate()
        
        this_time.enabled = true
        this_time.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func applyDefaults() {
        let defaults = Defaults()
        
        this_time.text = String(defaults.thisTime)
        this_class_picker.selectRow(defaults.thisPaxPicker, inComponent: 0, animated: true)
        that_class_picker.selectRow(defaults.thatPaxPicker, inComponent: 0, animated: true)
    }
  
    func recalculate() {
        if let thisRun = Run(txtFieldTime: this_time, pickerIndex: this_class_picker.selectedRowInComponent(0)){
            let thatRun = Run(calculateFrom: thisRun.time,
                              thisPickerIndex: that_class_picker.selectedRowInComponent(0),
                              thisPaxIndex: Pax(index: that_class_picker.selectedRowInComponent(0)).paxIndex,
                              thatPaxIndex: thisRun.pax.paxIndex)
            that_time.text = "\(thatRun.time)"
            Defaults().set(thisRun.time,
                           thisPaxPickerNew: thisRun.pax.pickerIndex,
                           thatPaxPickerNew: thatRun.pax.pickerIndex)
            update_this_more_info(thisRun, thatRun:thatRun)
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scca.classNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return scca.classNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        recalculate()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.characters.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.characters.count - range.length
        return newLength <= 7
    }
    
    func update_this_more_info(thisRun:Run, thatRun:Run) {
        let difference = thisRun.time - thatRun.time,
            rounded_difference = round(1000 * difference) / 1000
        
        this_time_more_info.text = "\(thisRun.pax.paxClass) PAX: \(thisRun.pax.paxIndex) \rDiff: \(rounded_difference)s"
        that_time_more_info.text = "\(thatRun.pax.paxClass) PAX: \(thatRun.pax.paxIndex)"
    }
}

