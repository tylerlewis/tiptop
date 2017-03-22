//
//  SettingsViewController.swift
//  tiptop
//
//  Created by Tyler Hackley Lewis on 3/21/17.
//  Copyright © 2017 Tyler Hackley Lewis. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipValueSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Show default tip value if saved
        var tipValueIndex = 0
        let defaults = UserDefaults.standard
        let defaultTipValueIndex:Int? = defaults.integer(forKey: "defaultTipValueIndex")
        if (defaultTipValueIndex != nil) {
            tipValueIndex = defaultTipValueIndex!
        }
        
        tipValueSegmentedControl.selectedSegmentIndex = tipValueIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipValueChange(_ sender: Any) {
        let selectedTipValueIndex = tipValueSegmentedControl.selectedSegmentIndex
        saveDefaultTipValue(defaultTipValueIndex: selectedTipValueIndex)
    }
    
    func saveDefaultTipValue(defaultTipValueIndex: Int) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipValueIndex, forKey: "defaultTipValueIndex")
        defaults.synchronize()
    }

}
