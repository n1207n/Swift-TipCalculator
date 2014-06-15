//
//  ViewController.swift
//  Tip Calculator Debug
//
//  Created by Silin Na on 6/14/14.
//  Copyright (c) 2014 Silin Na. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    @IBOutlet var preTaxedBillField : UITextField
    @IBOutlet var calculateTipButton : UIButton
    @IBOutlet var tipField : UITextField
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        preTaxedBillField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if(identifier == "showCalculatedResults" &&
            preTaxedBillField.text == "" || tipField.text == "") {
            let alertController = UIAlertController(title: "Wait a sec!", message: "Enter your bill and tip", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
    
            return false
        }
        
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if(segue.identifier == "showCalculatedResults") {
                var showCalculatedResultsViewController: ShowCalculatedResultViewController = segue.destinationViewController as ShowCalculatedResultViewController
                
                showCalculatedResultsViewController.preTaxedBill = preTaxedBillField.text.bridgeToObjectiveC().floatValue
                showCalculatedResultsViewController.tip = tipField.text.bridgeToObjectiveC().floatValue                
        }
    }
}

