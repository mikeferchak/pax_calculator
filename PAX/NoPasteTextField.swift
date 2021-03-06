//
//  NoPasteTextField.swift
//  PAX
//
//  Created by Mike Ferchak on 4/29/16.
//  Copyright © 2016 Michael Ferchak. All rights reserved.
//

import Foundation

import UIKit

class NoPasteTextField: UITextField {
    func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
