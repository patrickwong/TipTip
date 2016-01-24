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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = Double(billField.text!)
        var tipAmount = billAmount! * 0.2
        var total = billAmount! + tipAmount
        tipLabel.text = "\(tipAmount)"
        totalLabel.text = "\(total)"
    }

}

