//
//  BillSplitViewController.swift
//  Bill Splitter
//
//  Created by Devontae Reid on 2/8/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class BillSplitViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - IBOutlets -
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipView: DescriptiveSlider!
    @IBOutlet weak var splitView: DescriptiveSlider!
    @IBOutlet weak var tipPerPerson: PerPersonView!
    @IBOutlet weak var totalPerPerson: PerPersonView!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var payTipButton: UIButton!
    
    // MARK: - Private Properties -
    private let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    private var billAmount: Double = 0.0 {
        didSet{
            updateTipLabel()
            updateTotalLabel()
        }
    }
    
    private var tipValue: Double = 0.0 {
        didSet{
            updateTipLabel()
        }
    }
    
    private var totalValue: Double = 0.0 {
        didSet{
            updateTotalLabel()
        }
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .black
        
        let alpha: CGFloat = 0.5
        
        
        // Setup Textfield
        tipTextField.backgroundColor = UIColor.white.withAlphaComponent(alpha)
        tipTextField.textColor = UIColor.white
        tipTextField.text = "240.00"
        let number = numberFormatter.number(from: tipTextField.text!)
        billAmount = (number?.doubleValue)!
        
        // Setup Tip Button
        payTipButton.backgroundColor = UIColor.white.withAlphaComponent(alpha)
        payTipButton.layer.cornerRadius = 10
        
        tipView.titleLabel.text = "Tip :"
        tipView.slider.minimumValue = 0
        tipView.slider.maximumValue = 20
        tipView.slider.setValue(10, animated: true)
        tipView.minValueLabel.text = "0%"
        tipView.maxValueLabel.text = "20%"
        tipView.slider.addTarget(self, action: #selector(adjustTipPercentage(sender:)), for: .valueChanged)
        
        
        splitView.titleLabel.text = "Split :"
        splitView.slider.minimumValue = 1
        splitView.slider.maximumValue = 10
        splitView.slider.setValue(2, animated: true)
        splitView.minValueLabel.text = "1"
        splitView.maxValueLabel.text = " 10"
        splitView.slider.addTarget(self, action: #selector(adjustNumberOfPeople(sender:)), for: .valueChanged)
        
        tipPerPerson.titleLabel.text = "Tip"
        totalPerPerson.titleLabel.text = "Total"
        
        let tipSliderValue = tipView.slider.value
        tipValue = (billAmount/100) * Double(Int(tipSliderValue))
        tipPerPerson.valueLabel.text = numberFormatter.string(from: NSNumber(value: Int(tipSliderValue)))! + "%"
        tipPerPerson.costLabel.text = "$ " + numberFormatter.string(from: NSNumber(value: tipValue))!
        let totalSliderValue = splitView.slider.value
        totalValue = (tipValue + billAmount)/Double(Int(totalSliderValue))
        totalPerPerson.valueLabel.text = "x" + numberFormatter.string(from: NSNumber(value: Int(totalSliderValue)))!
        totalPerPerson.costLabel.text = "$ " + numberFormatter.string(from: NSNumber(value: totalValue))!
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipFieldEditingChanged(_ sender: UITextField) {
        
        if let text = sender.text, let number = numberFormatter.number(from: text) {
            if !letterIsFound(input: text) {
                billAmount = number.doubleValue
                let tipSliderValue = tipView.slider.value
                tipValue = (billAmount/100) * Double(Int(tipSliderValue))
                tipPerPerson.valueLabel.text = numberFormatter.string(from: NSNumber(value: tipSliderValue))! + "%"
                tipPerPerson.costLabel.text = "$ " + numberFormatter.string(from: NSNumber(value: tipValue))!
                let totalSliderValue = splitView.slider.value
                totalValue = (tipValue + billAmount)/Double(Int(totalSliderValue))
                totalPerPerson.valueLabel.text = "x" + numberFormatter.string(from: NSNumber(value: totalSliderValue))!
                totalPerPerson.costLabel.text = "$ " + numberFormatter.string(from: NSNumber(value: totalValue))!
            }
        } else {
            billAmount = 0.00
        }
    }
    
    private func updateTipLabel() {
        if tipValue != 0.00 {
            tipPerPerson.costLabel.text = "$ " + numberFormatter.string(from: NSNumber(value: tipValue))!
        } else {
            tipPerPerson.costLabel.text = "0.00"
        }
    }
    
    private func updateTotalLabel() {
        if tipValue != 0.00 {
            totalPerPerson.costLabel.text = "$ " + numberFormatter.string(from: NSNumber(value: totalValue))!
        } else {
            totalPerPerson.costLabel.text = "0.00"
        }
    }
    
    @objc private func adjustTipPercentage(sender: UISlider) {
        tipValue = (billAmount/100) * Double(Int(sender.value))
        tipPerPerson.valueLabel.text = numberFormatter.string(from: NSNumber(value: Int(sender.value)))! + "%"
        tipPerPerson.costLabel.text = "$ " + numberFormatter.string(from: NSNumber(value: tipValue))!
        totalValue = (tipValue + billAmount)/Double(Int(splitView.slider.value))
        totalPerPerson.valueLabel.text = "x" + numberFormatter.string(from: NSNumber(value: Int(splitView.slider.value)))!
        totalPerPerson.costLabel.text = "$ " + numberFormatter.string(from: NSNumber(value: totalValue))!
        
    }
    
    @objc private func adjustNumberOfPeople(sender: UISlider) {
        totalValue = tipValue + (billAmount/Double(Int(sender.value)))
        totalPerPerson.valueLabel.text = "x" + numberFormatter.string(from: NSNumber(value: Int(sender.value)))!
        totalPerPerson.costLabel.text = "$ " + numberFormatter.string(from: NSNumber(value: totalValue))!
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        tipTextField.resignFirstResponder()
    }
    
    private func letterIsFound(input: String) -> Bool {
        let letters = NSCharacterSet.letters
        
        if let _ = input.rangeOfCharacter(from: letters) {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Delegate Functions -
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if letterIsFound(input: string) {
            return false
        } else {
            
            let currentLocal = Locale.current
            let decimalSeparator = currentLocal.decimalSeparator ?? "."
            
            let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
            let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
            
            if existingTextHasDecimalSeparator != nil,
                replacementTextHasDecimalSeparator != nil {
                return false
            } else {
                return true
            }
        }
    }

}
