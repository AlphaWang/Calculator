//
//  ViewController.swift
//  Calulator
//
//  Created by Alpha on 1/6/17.
//  Copyright © 2017 Alpha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // should have an initial value.
    var userIsInTheMiddleOfTyping = false

    @IBAction func touchDigit(_ sender: UIButton) {
        // `!` unwarp Optional, but would cause fatal error: unexpectedly found nil while unwrapping an Optional value
        // UIButton#currentTitle type is `String?`
        
        // this var was never mutated, use `let` instead.
        // and swift will infer the type, let digit: String =
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = displayDigit.text!
            displayDigit.text = textCurrentlyInDisplay + digit
        } else {
            displayDigit.text = digit
        }
        userIsInTheMiddleOfTyping = true
        
        print("touched \(digit) digit")
    }
    
    // drag the label to here, will create a property.
    // UILabel? means an Optional type
    // UILabel! means an UILabel type
    @IBOutlet weak var displayDigit: UILabel!
    
    // computed property : to avoid type convert
    var displayValue: Double {
        get {
            return Double(displayDigit.text!)!
        }
        set {
            displayDigit.text = String(newValue)
        }
    }
    
    // drag the button to here, will create an action.
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        
        // unwrap only if it's not nil
        if let methematicalSymbol = sender.currentTitle {
            if methematicalSymbol == "π" {
                displayValue = M_PI;
                // displayDigit.text = String(M_PI)
            } else if methematicalSymbol == "√" {
                displayValue = sqrt(displayValue)
            }
        }
    }
    
}

