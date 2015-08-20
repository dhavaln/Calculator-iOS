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
    
    func operate(operation: (Double, Double) -> Double ){
        if operandStack.count < 2 {
            return;
        }
        
        displayValue = operation( operandStack.removeLast(), operandStack.removeLast() );
        enter()
    }
    
    // Current XCode/Swift version does not allow the method overriding, hence the private attribute which allows the overriding without changing the function name
    private func operate(operation: Double -> Double ){
        if operandStack.count < 1 {
            return;
        }
        
        displayValue = operation( operandStack.removeLast() );
        enter()
    }
    
    @IBAction func performOperation(sender: UIButton) {
        var operation = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        switch operation {
        case "+": operate() { $0 + $1 }
        case "−": operate() { $1 - $0 }
        case "✕": operate() { $0 * $1 }
        case "⁒": operate() { $1 / $0 }
        case "√": operate() { sqrt($0) }
        default: println("Operation Missing")
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

