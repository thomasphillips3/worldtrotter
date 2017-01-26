//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Thomas Phillips on 1/13/17.
//  Copyright © 2017 Aspire. All rights reserved.
//

import UIKit

class ConversionViewController : UIViewController {
    @IBOutlet var celsiusLabel : UILabel!
    @IBOutlet var textField : UITextField!
    
    var fahrenheitValue : Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue : Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9) as Double
        } else {
            return nil
        }
    }
    
    @IBAction func fahrenheitFieldChanged(textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.string(for: value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
}
