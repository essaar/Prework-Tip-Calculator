//
//  ViewController.swift
//  Prework Tip Calculator
//
//  Created by Saksham Rathore on 09/08/21.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var splitTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.text = defaults.string(forKey: "billAmountTextField")
        tipSelector.selectedSegmentIndex = defaults.integer(forKey: "tipPercentage")
        splitTextField.text = defaults.string(forKey: "noOfPeople")
        if splitTextField.text == "" {splitTextField.text = "1"}
        calculateTip(self)
    }
    
     override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField?.becomeFirstResponder()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //locale specific currency & thousands separator
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        //get values from text fields
        let billAmount = Double(billAmountTextField.text!) ?? 0
        let noOfPeople = Double(Int(splitTextField.text!) ?? 1)
        
        //set default values
        if tipSelector.selectedSegmentIndex == -1 {tipSelector.selectedSegmentIndex = 0}
        //if splitTextField.text == "" {splitTextField.text = "1"}
        
        //calculate tip amount
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = billAmount * tipPercentages[tipSelector.selectedSegmentIndex]
        let totalAmount = billAmount + tip
        let splitAmount = Double(totalAmount/noOfPeople)
        
        //save current inputs
        defaults.set(billAmountTextField.text, forKey: "billAmountTextField")
        defaults.set(tipSelector.selectedSegmentIndex, forKey: "tipPercentage")
        defaults.set(splitTextField.text, forKey: "noOfPeople")
        
        //update tip label
        tipAmountLabel.text = currencyFormatter.string(from: NSNumber(value: tip))!
        //update total label
        totalAmountLabel.text = currencyFormatter.string(from: NSNumber(value: totalAmount))!
        //update slpit label
        splitLabel.text = currencyFormatter.string(from: NSNumber(value: splitAmount))! + " per person"
    }
    
}

