//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipButtons: [String: UIButton] = [:]
    
    var tipCalculatorBrain = TipCalculatorBrain()
    
    let tipPercentage = [
        "0%": 0,
        "10%": 0.1,
        "20%": 0.2
    ]
    
    var tipPercentageText: String = "10%"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        tipPercentageText = sender.titleLabel?.text ?? ""
        
        let tip = tipPercentage[tipPercentageText] ?? 0
        
        tipCalculatorBrain.setTipValue(tip)
        
        tipButtons[tipPercentageText]?.isSelected = true
        
        tipButtons.forEach{(percentage, button) in
            if tipPercentageText == percentage {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
            
        }
    }
    
    @IBAction func splitValueStepperChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        let split = Int(sender.value)
        
        splitNumberLabel.text = String(split)
        tipCalculatorBrain.setSplitValue(split)
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        let billValue = Double(billTextField?.text ?? "0") ?? 0
        
        tipCalculatorBrain.setBillValue(billValue)
        tipCalculatorBrain.calculate()
        
        self.performSegue(withIdentifier: "goToResultScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultScreen"{
            let destination = segue.destination as! ResultViewController
            
            destination.resultText = String(format: "%.2f", tipCalculatorBrain.getResult())
            
            let splitValue = tipCalculatorBrain.getSplitValue()
            
            destination.settingsText = "Split between \(String(splitValue)) with \(tipPercentageText) tip."
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipButtons = [
            "0%": zeroPercentButton,
            "10%": tenPercentButton,
            "20%": twentyPercentButton
        ]
        
    }
}

