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
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
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
        tipTextField.text = "$240.00"
        
        // Setup Tip Button
        payTipButton.backgroundColor = UIColor.white.withAlphaComponent(alpha)
        payTipButton.layer.cornerRadius = 10
        
        settings()
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
                tipValue = number.doubleValue
            }
        } else {
            tipValue = 0.00
        }
    }
    
    private func settings() {
        
        tipView.titleLabel.text = "Tip :"
        tipView.slider.minimumValue = 0
        tipView.slider.maximumValue = 20
        tipView.minValueLabel.text = "0%"
        tipView.maxValueLabel.text = "20%"
        
        
        splitView.titleLabel.text = "Split :"
        splitView.slider.minimumValue = 0
        splitView.slider.maximumValue = 10
        splitView.minValueLabel.text = "0"
        splitView.maxValueLabel.text = " 10"
        
        tipPerPerson.titleLabel.text = "Tip"
        totalPerPerson.titleLabel.text = "Total"
        totalPerPerson.costLabel.text = "$ 75.00"
    }
    
    private func updateTipLabel() {
        if tipValue != 0.00 {
            tipPerPerson.costLabel.text = numberFormatter.string(from: NSNumber(value: tipValue))
        } else {
            tipPerPerson.costLabel.text = "0.00"
        }
    }
    
    private func updateTotalLabel() {
        if tipValue != 0.00 {
            totalPerPerson.titleLabel.text = numberFormatter.string(from: NSNumber(value: totalValue))
        } else {
            totalPerPerson.titleLabel.text = "0.00"
        }
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
