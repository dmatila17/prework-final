//
//  ViewController.swift
//  prework-final
//
//  Created by Dylan Matila on 1/1/21.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var splitTotalLabel: UILabel!
    @IBOutlet weak var splitField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
        
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let numOfPeople = Int(splitField.text!) ?? 1

        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        let totalEach = total / Double(numOfPeople)
        
        let position = tipControl.selectedSegmentIndex
        if(position == 0) {
            tipSlider.value = 15
        }else if(position == 1) {
            tipSlider.value = 18
        }else if(position == 2){
            tipSlider.value = 20
        }
        
        sliderLabel.text = String(Int(tipSlider.value))
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitTotalLabel.text = String(format: "$%.2f", totalEach)

    }
    
    @IBAction func sliderCalculateTip(_ sender: UISlider) {
        let bill = Double(billField.text!) ?? 0
        let currentValue = Int(sender.value)
        let numOfPeople = Int(splitField.text!) ?? 1
        
        let percent = Double(currentValue) / 100
        
        let tip = bill * percent
        let total = tip + bill
        let totalEach = total / Double(numOfPeople)
        
        sliderLabel.text = String(Int(tipSlider.value))
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitTotalLabel.text = String(format: "$%.2f", totalEach)
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    
    
    


}

