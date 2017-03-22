//
//  ViewController.swift
//  tiptop
//
//  Created by Tyler Hackley Lewis on 3/20/17.
//  Copyright © 2017 Tyler Hackley Lewis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var customPercentageField: UITextField!
    
    let expectedTipValues = [0.15, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Use default tip value if user has set this
        var tipValueIndex = 0
        let defaults = UserDefaults.standard
        let defaultTipValueIndex:Int? = defaults.integer(forKey: "defaultTipValueIndex")
        if (defaultTipValueIndex != nil) {
            tipValueIndex = defaultTipValueIndex!
        }
        
        tipControl.selectedSegmentIndex = tipValueIndex
        calculateAndSetTip(tipPercentage: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func onBillAmountChange(_ sender: Any) {
        calculateAndSetTip(tipPercentage: nil)
    }
    
    @IBAction func onTipValueChange(_ sender: Any) {
        view.endEditing(true)
        customPercentageField.text = ""
        calculateAndSetTip(tipPercentage: nil)
    }
    
    
    @IBAction func onCustomTipPercentageChange(_ sender: Any) {
        tipControl.selectedSegmentIndex = -1
        
        var customPercentage = Double(customPercentageField.text!) ?? 0
        customPercentage = customPercentage / 100
        calculateAndSetTip(tipPercentage: customPercentage)
    }
    
    func calculateAndSetTip(tipPercentage: Double?) {
        let billAmount = Double(billField.text!) ?? 0
        let tipMultiplier = tipPercentage ?? expectedTipValues[tipControl.selectedSegmentIndex]
        let tip = billAmount * tipMultiplier
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

