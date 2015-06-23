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

    @IBAction func time_changed(sender: AnyObject) {
        recalculate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.this_pax_picker.delegate = self
        self.that_pax_picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    func recalculate() {
        if this_time.text != "" && this_time.text != nil {
            let my_time = Double(this_time.text!)!,
                this_pax = Scca().pax_at_index(this_pax_picker.selectedRowInComponent(0)),
                that_pax = Scca().pax_at_index(that_pax_picker.selectedRowInComponent(0)),
            value = Calculator().calculate(my_time, this_pax: this_pax,that_pax: that_pax)
            that_time.text = "\(value)"
            
            update_this_more_info()
        }
    }
    
    func update_this_more_info() {
        if this_time.text != "" && this_time.text != nil && that_time.text != "" && that_time.text != nil {
            let this_class = Scca().class_name_at_index(this_pax_picker.selectedRowInComponent(0)),
                this_pax = Scca().pax_at_index(this_pax_picker.selectedRowInComponent(0)),
                my_time = Double(this_time.text!)!,
                other_time = Double(that_time.text!)!,
                difference = my_time - other_time
            
            this_time_more_info.text = "\(this_class) PAX: \(this_pax) \r\(difference) difference"
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
}

