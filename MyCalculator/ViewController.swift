//
//  ViewController.swift
//  MyCalculator
//
//  Created by Thomas, Catherine on 8/23/17.
//  Copyright © 2017 FOCAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //----------------- VARIABLE DECLARATION EXAMPLE ---------//
    @IBOutlet var numberLabel: UILabel!
    var currentOperation: String? = nil
    var mathString: String = ""
    
    
    // -------------- FUNCTIONS EXAMPLES ----------------//
    // clear numbers function
    @IBAction func hitClear(){
        numberLabel.text = "0"
        currentOperation = nil
        mathString = "" 
    }
    
    // change sign function
    @IBAction func hitChangeSign() {
        let number = Double(numberLabel.text ?? "0") ?? 0
        numberLabel.text = "\(-number)"
    }
    
    // percentage function
    @IBAction func hitPercentage() {
        // ------------------- COMMENTS & MATH EXAMPLE ----------//
        // divides the number by 100
        let number = Double(numberLabel.text ?? "0") ?? 0
        numberLabel.text = "\(number/100)"
    }
    
    @IBAction func hitNumber(_ sender: UIButton) {
        if let number = sender.titleLabel?.text {
            if let original = numberLabel.text, original != "0" && currentOperation == nil {
                numberLabel.text?.append(number)
            } else {
                
                // ----------- IF LET EXAMPLE ------------------//
                if let op = currentOperation {
                    mathString.append(numberLabel.text ?? "")
                    
                    //------------- IF STATEMENT EXAMPLE -----------//
                    if op == "x" {
                        mathString.append("*")
                    } else {
                        mathString.append(op)
                    }
                    
                    currentOperation = nil
                }
                
                numberLabel.text = number
            }
        }
    }
    
    @IBAction func hitOperation(_ sender: UIButton) {
        currentOperation = sender.titleLabel?.text
    }
    
    @IBAction func hitDecimal() {
        if let text = numberLabel.text, !text.contains(".") {
            numberLabel.text?.append(".")
        }
    }
    
    // equals function
    @IBAction func hitEquals() {
        // --------- OPTIONAL UNWRAPPING EXAMPLE --------//
        mathString.append(numberLabel.text ?? "")
        let exp = NSExpression(format: mathString)
        
        if let result = exp.expressionValue(with: nil, context: nil) as? Double {
            numberLabel.text = "\(result)"
        }
        mathString = ""
    }
}

