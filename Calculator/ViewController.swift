//
//  ViewController.swift
//  Calculator
//
//  Created by Dhaval Nagar on 19/08/15.
//  Copyright (c) 2015 Dhaval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTypingANumber = false;
    
    @IBOutlet weak var display: UILabel!

    var operandStack = Array<Double>()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!;
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        }else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func performOperation(sender: UIButton) {
        var operation = sender.currentTitle
        
        switch operation {
            case "":
            case "":
            case "":
            case "":
            default:
        }
    }
    
    @IBAction func enter() {
        operandStack.append(displayValue)
        userIsInTheMiddleOfTypingANumber = false;
        println("Operand Stack: \(operandStack)");
    }
    
    var displayValue: Double{
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
}

