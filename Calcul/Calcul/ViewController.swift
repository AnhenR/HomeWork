//
//  ViewController.swift
//  Calcul
//
//  Created by user on 12.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var firstInput: Double = 0
    private var secondInput: Double = 0
    private var operation: String = ""
    private var stillTiping = false
    private var inputInt: Double {
        
        get {
            return Double(resultLable.text!)!
        }
        set {
            let new = "\(newValue)"
            if new.contains(".0"){
                resultLable.text = "\(new.dropLast(2))"
            } else{
            resultLable.text = new
            stillTiping = false
            }
        }
    }
    
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet var allButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in allButton {
            button.layer.cornerRadius = button.frame.height / 2
        }
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        let digit = sender.titleLabel?.text
        if stillTiping{
            if resultLable.text!.count < 7 {
                resultLable.text = resultLable.text! + (digit)!
            }
        }
        else {
            resultLable.text = digit
            stillTiping = true
        }
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "AC":
            firstInput = 0
            inputInt = 0
            secondInput = 0
            resultLable.text = "0"
            stillTiping = false
            
        case ",":
            if (resultLable.text?.contains("."))! {
                resultLable.text = resultLable.text
            }
            else{
                resultLable.text = resultLable.text! + "."
            }
            
        case "+/-":
            inputInt = -inputInt
        case "%":
            if firstInput == 0 {
                inputInt = inputInt / 100
            }
            else {
                secondInput = firstInput * inputInt / 100
            }
            stillTiping = false
        default: break
        }
    }
    
    @IBAction func maths(_ sender: UIButton) {
        operation = (sender.titleLabel?.text)!
        firstInput = inputInt
        stillTiping = false
    }
    
    @IBAction func equals(_ sender: Any) {
        if stillTiping {
            secondInput = inputInt
        }
        switch operation {
        case "+":
            twoInput{$0 + $1}
        case "-":
            twoInput{$0 - $1}
        case "*":
            twoInput{$0 * $1}
        case "/":
            twoInput{$0 / $1}
        default: break
        }
    }
    
    private func twoInput(operationNow:(Double,Double)-> Double){
        inputInt = operationNow(firstInput,secondInput)
        stillTiping = false
    }
}

