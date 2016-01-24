//
//  ViewController.swift
//  tiptip
//
//  Created by Patrick Wong on 1/23/16.
//  Copyright © 2016 Patrick Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var billAmount: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        tipLabel.text = ""
        totalLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        billAmount = NSString(string: billField.text!).doubleValue
        var tipPercentages = [0.15, 0.18, 0.2]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let tipAmount = billAmount! * tipPercentage
        let total = billAmount! + tipAmount
        
        tipLabel.text = "$\(tipAmount)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

