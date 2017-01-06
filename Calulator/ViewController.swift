//
//  ViewController.swift
//  Calulator
//
//  Created by Alpha on 1/6/17.
//  Copyright © 2017 Alpha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func touchDigit(_ sender: UIButton) {
        // `!` would cause fatal error: unexpectedly found nil while unwrapping an Optional value
        let digit = sender.currentTitle!
        print("touched \(digit) digit")
    }
}

