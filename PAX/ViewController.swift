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
    @IBOutlet var this_pax_picker:UIPickerView!
    @IBOutlet var that_pax_picker:UIPickerView!
    @IBOutlet var that_time:UILabel!
    @IBOutlet var that_time_more_info:UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func time_changed(sender: AnyObject) {
        recalculate()
    }
    
    func load_defaults() {
        if let defaults_this_time = defaults.stringForKey("this_time"){
            let defaults_this_pax = defaults.integerForKey("this_pax")
            let defaults_that_pax = defaults.integerForKey("that_pax")

            if self.this_time.text == nil {
                self.this_time.text = defaults_this_time
            }
            self.this_pax_picker.selectRow(defaults_this_pax, inComponent: 0, animated: true)
            self.that_pax_picker.selectRow(defaults_that_pax, inComponent: 0, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.this_pax_picker.delegate = self
        self.that_pax_picker.delegate = self
        
        load_defaults()
        
        this_time.enabled = true
        this_time.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    func recalculate() {
        if let my_time = Double(this_time.text!) {
            let this_pax = Scca().pax_at_index(this_pax_picker.selectedRowInComponent(0)),
                that_pax = Scca().pax_at_index(that_pax_picker.selectedRowInComponent(0)),
                value = Calculator().calculate(my_time, this_pax: this_pax,that_pax: that_pax)
                that_time.text = "\(value)"
            
            defaults.setObject(my_time, forKey: "this_time")
            defaults.setObject(this_pax_picker.selectedRowInComponent(0), forKey: "this_pax")
            defaults.setObject(that_pax_picker.selectedRowInComponent(0), forKey: "that_pax")
            
            update_this_more_info()
        }
    }
    
    func update_this_more_info() {
        if this_time.text != "" && this_time.text != nil && that_time.text != "" && that_time.text != nil {
            let this_class = Scca().class_name_at_index(this_pax_picker.selectedRowInComponent(0)),
                that_class = Scca().class_name_at_index(that_pax_picker.selectedRowInComponent(0)),
                this_pax = Scca().pax_at_index(this_pax_picker.selectedRowInComponent(0)),
                that_pax = Scca().pax_at_index(that_pax_picker.selectedRowInComponent(0)),
                my_time = Double(this_time.text!)!,
                other_time = Double(that_time.text!)!,
                difference = my_time - other_time,
                rounded_difference = round(1000 * difference) / 1000
            
            this_time_more_info.text = "\(this_class) PAX: \(this_pax) \rDiff: \(rounded_difference)s"
            that_time_more_info.text = "\(that_class) PAX: \(that_pax)"
        }
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
  
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Scca().class_names().count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return Scca().class_names()[row]
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
}

