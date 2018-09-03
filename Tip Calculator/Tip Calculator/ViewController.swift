//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Claudia Nelson on 8/27/18.
//  Copyright © 2018 Claudia Nelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tipPercent = 15
    var decimal = 1
    var num = 0.0
    var formating = "$%.0f"
    
    @IBOutlet weak var pretax: UILabel!
    @IBOutlet weak var posttax: UILabel!
    @IBOutlet weak var tax: UILabel!
    
    @IBAction func clearScreen(_ sender: UIButton) {
        pretax.text = "$0"
        num = 0
        decimal = 1
        formating = "$%.0f"
        posttax.text = setTip()
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if sender.tag <= 9{
            //sender.tag
            if decimal == 1{
                num = num*10 + Double(sender.tag)
            }
            else if decimal <= 100{
                num = Double(num) + Double(sender.tag)/Double(decimal)
                if decimal == 10{
                    formating = "$%.1f"
                }
                else{
                    formating = "$%.2f"
                }
                decimal *= 10
            }else{
                //Do something
            }
            posttax.text = setTip()
            pretax.text = String(format: formating, num)
        }
        if sender.tag == 13 && decimal == 1{
            decimal = 10
        }
    }
    @IBOutlet weak var sc: UISegmentedControl!
    @IBAction func setTip(_ sender: Any) {
        switch  sc.selectedSegmentIndex{
        case 0:
            tipPercent = 15
        case 2:
            tipPercent = 30
        default:
            tipPercent = 20
        }
        tax.text = "tip: " + String(tipPercent) + "%"
        posttax.text = setTip()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posttax.text = setTip()
        // Do any additional setup after loading the view, typically from a nib.
        pretax.text = "$0"
        tax.text = "tip: " + String(tipPercent) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setTip() -> String {
        let myMath = (1.0 + Double(tipPercent)/100.0)*Double(num)
        return String(format: "total: $%.2f", myMath)
    }
    

}

