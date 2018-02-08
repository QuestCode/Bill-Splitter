//
//  BillSplitViewController.swift
//  Bill Splitter
//
//  Created by Devontae Reid on 2/8/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class BillSplitViewController: UIViewController {

    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var tipPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var payTipButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
