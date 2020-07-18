//
//  ViewController.swift
//  tip
//
//  Created by Maanya Goenka on 7/17/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    //@IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var tipSlider: UISlider!
    @IBOutlet var groupSizeCounter: UIStepper!
    @IBOutlet var groupSizeLabel: UILabel!
    @IBOutlet var perPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            billField.becomeFirstResponder()
    }
    
    @IBAction func OnTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //let tipPercentages = [0.15, 0.18, 0.2]
        let bill = Double(billField.text!) ?? 0.0
        let tipPercent = Double(tipSlider.value)
        let tip = bill * tipPercent * 0.01
        let total = bill + tip
        //using a stepper to update the number of group members
        groupSizeLabel.text = String(Int(groupSizeCounter.value) + 1)
        
        tipLabel.text = String(format: "%.2f%%", tipPercent)
        tipAmountLabel.text = String(format: "$%.2f%", tip)
        totalLabel.text = String(format: "$%.2f", total)
        perPersonLabel.text = String(format: "$%.2f", (total/(Double(groupSizeLabel.text!) ?? 1.0)))
    }
    
}

