//
//  ViewController.swift
//  Prework Tip Calculator
//
//  Created by Saksham Rathore on 09/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount from text field
        let billAmount = Double(billAmountTextField.text!) ?? 0
        
        //calculate tip amount
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = billAmount * tipPercentages[tipSelector.selectedSegmentIndex]
        let totalAmount = billAmount + tip
        
        //update tip label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total label
        totalAmountLabel.text = String(format: "$%.2f", totalAmount)
    }
    
}

