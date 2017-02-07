//
//  ViewController.swift
//  Calulator
//
//  Created by Alpha on 1/6/17.
//  Copyright © 2017 Alpha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    @IBOutlet weak var displayDigit: UILabel!
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let methematicalSymbol = sender.currentTitle {
            if methematicalSymbol == "π" {
                displayDigit.text = String(M_PI)
            }
        }
    }
}

