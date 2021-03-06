//
//  ViewController.swift
//  Calculator
//
//  Created by Alessandro dos santos pinto on 2/16/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userInTheMiddleOfTypingDigit = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userInTheMiddleOfTypingDigit {
            if digit == "." {
                if (display.text?.contains("."))! {
                    return
                }
            }
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userInTheMiddleOfTypingDigit = true
        }
    }
    
    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userInTheMiddleOfTypingDigit {
            brain.setOperand(displayValue)
            userInTheMiddleOfTypingDigit = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
    
    @IBAction func clearDisplay(_ sender: UIButton) {
        
        display.text = "0";
        userInTheMiddleOfTypingDigit = false;
    }
    
}

