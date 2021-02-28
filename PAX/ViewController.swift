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
    @IBOutlet var difference_label:UILabel!
    
    @IBAction func time_changed(_ sender: AnyObject) {
        recalculate()
    }
    
    let scca = Scca()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        this_class_picker.delegate = self
        that_class_picker.delegate = self
        
        applyDefaults()
        recalculate()
        
        this_time.isEnabled = true
        this_time.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        UIMenuController.shared.hideMenu()
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender:sender)
    }
    
    func applyDefaults() {
        let defaults = Defaults()
        
        this_class_picker.selectRow(defaults.thisPaxPicker, inComponent: 0, animated: true)
        that_class_picker.selectRow(defaults.thatPaxPicker, inComponent: 0, animated: true)
        
        if defaults.thisTime > 0 {
            this_time.text = String(defaults.thisTime)
        }
    }
  
    func recalculate() {
        if let thisRun = Run(txtFieldTime: this_time, pickerIndex: this_class_picker.selectedRow(inComponent: 0)){
            let thatRun = Run(calculateFrom: thisRun.time,
                              thisPickerIndex: thisRun.pax.pickerIndex,
                              thatPickerIndex: that_class_picker.selectedRow(inComponent: 0))
            
            that_time.text = "\(thatRun.time)"
            Defaults().set(thisRun.time,
                           thisPaxPickerNew: thisRun.pax.pickerIndex,
                           thatPaxPickerNew: thatRun.pax.pickerIndex)
            update_this_more_info(thisRun, thatRun:thatRun)
        }
    }
    
    @objc func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scca.classNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return scca.classNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        recalculate()
    }
    
    @objc func textField(_ textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 7
    }
    
    func update_this_more_info(_ thisRun:Run, thatRun:Run) {
        let difference = thatRun.time - thisRun.time,
            rounded_difference = round(1000 * difference) / 1000
        
        this_time_more_info.text = "\(thisRun.pax.paxClass): \(thisRun.pax.paxIndex)"
        that_time_more_info.text = "\(thatRun.pax.paxClass): \(thatRun.pax.paxIndex)"
        difference_label.text = "Difference: \(rounded_difference)s"
    }
}

