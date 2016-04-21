//
//  ViewController.swift
//  Calculator
//
//  Created by Liu's MBA on 4/8/16.
//  Copyright © 2016 dancite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var displayOfCalculationHistory: UILabel!
    
    func displayHistory(opToAppend: String) {
        if userIsInTheMiddleOfTypingANumber == true{
            
            displayOfCalculationHistory.text = displayOfCalculationHistory.text! + opToAppend
        }
        
    }
    
    var brain = CalculatorBrain()
    
    
    var userIsInTheMiddleOfTypingANumber = false
    var aDotSignHasBeenInputed = false
    
    
    
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber{
            display.text = display.text! + digit
            self.displayHistory(digit)
        }
        else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
            self.displayHistory(digit)
        }
    }
    
// Task 2: Make sure to input a legal floating point number
    
    @IBAction func appendADotSign(sender: UIButton) {
        if display.text!.rangeOfString(".") != nil {
            print("dot found")
            return
        }
        else{
            display.text = display.text! + "."
            userIsInTheMiddleOfTypingANumber = true
            self.displayHistory(".")
        }
        
    }
    

    @IBAction func inputValueOfPi(sender: UIButton) {
        let valueOfPi = M_PI
        if userIsInTheMiddleOfTypingANumber == false{
            display.text = "\(valueOfPi)"
            userIsInTheMiddleOfTypingANumber = true
        }

    }
    
    
    
    @IBAction func operate(sender: UIButton) {
//        let operation = sender.currentTitle!
//        displayOfCalculationHistory.text = displayOfCalculationHistory.text! + sender.currentTitle!
//        if userIsInTheMiddleOfTypingANumber{
//            enter()
//        }
//
//        switch operation {
//        case "×": performOperation {$0 * $1}
//        case "÷": performOperation {$1 / $0}
//        case "+": performOperation {$0 + $1}
//        case "-": performOperation {$1 - $0}
//        case "√": performOperationWithOneArgument {sqrt($0)}
//        case "sin": performOperationWithOneArgument{sin($0)}
//        case "cos": performOperationWithOneArgument{cos($0)}
//        default:
//            break
//        }
    }
    
//    func performOperation(operation:(Double,Double) -> Double){
//        if operandStack.count >= 2{
//            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
//            enter()
//        }
//    }
//    
//    func performOperationWithOneArgument(operation: Double -> Double){
//        if operandStack.count >= 1{
//            displayValue = operation(operandStack.removeLast())
//            enter()
//        }
//    }
    
//    func performMultiply(op1:Double,op2:Double)->Double{
//        return op1 * op2
//    }
    
//    var operandStack = Array<Double>()
    
    @IBAction func enter() {
//        operandStack.append(displayValue)
//        self.displayHistory(" ")
//        userIsInTheMiddleOfTypingANumber = false
//        print("\(operandStack)")
        
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        } else {
            displayValue = 0
        }
        
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    
    @IBAction func clearOut(sender: UIButton) {
        operandStack.removeAll()
        display.text = "0"
        displayOfCalculationHistory.text = " "
        userIsInTheMiddleOfTypingANumber = false
    }
    
    
    
}

