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
            resultLable.text = "\(newValue)"
            stillTiping = false
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
        operation = (sender.titleLabel?.text)!
        firstInput = inputInt
        stillTiping = false
        
        switch sender.titleLabel?.text {
        case "AC":
            resultLable.text = "0"
        case ",":
            if resultLable!.text?.contains(",") == true {
                resultLable.text = resultLable.text
            }
            else if resultLable!.text?.contains(",") == false {
                resultLable.text = resultLable.text! + (sender.titleLabel?.text)!
            }
        case "+/-":
            resultLable.text = "-\(resultLable.text!)"
        case "%":
            let resultLabelNumber = Double(resultLable.text!)
            resultLable.text =  "\(resultLabelNumber! / 100)"
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

