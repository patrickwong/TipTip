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
    @IBOutlet weak var tipHeaderLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalHeaderLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var divider: UIView!
    
    var billAmount: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        tipLabel.text = ""
        totalLabel.text = ""
        fadeOut()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        billField.text = ""
        fadeOut()
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
        fadeOut()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func fadeOut(){
        if (billField.text == ""){
            tipHeaderLabel.alpha = 0
            tipLabel.alpha = 0
            tipControl.alpha = 0
            divider.alpha = 0
            totalHeaderLabel.alpha = 0
            totalLabel.alpha = 0
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.tipHeaderLabel.alpha = 1
                self.tipLabel.alpha = 1
                self.tipControl.alpha = 1
                self.divider.alpha = 1
                self.totalHeaderLabel.alpha = 1
                self.totalLabel.alpha = 1
            })
        }
    }

}

