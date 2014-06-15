//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Silin Na on 6/14/14.
//  Copyright (c) 2014 Silin Na. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    // IBOutlet variables
    @IBOutlet var preTaxedBillField : UITextField
    @IBOutlet var calculateTipButton : UIButton
    @IBOutlet var tipField : UITextField
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Let put the input focus on the preTaxedBillField first when the view got loaded.
        preTaxedBillField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func canBecomeFirstResponder() -> Bool {
        // Enable to use FirstResponder on the preTaxedBillField
        return true
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        // Before we perform showCalculatedResults segue
        // Check if preTaxedBillField and tipField are empty
        if(identifier == "showCalculatedResults" &&
            preTaxedBillField.text == "" || tipField.text == "") {
            
            // If they are, create UIAlertController to alert the user
            // that they need to enter both of fields
            let alertController = UIAlertController(title: "Wait a sec!", message: "Enter your bill and tip", preferredStyle: UIAlertControllerStyle.Alert)

            // Add the action button with OK
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))

            // Present this alert controller from this view
            self.presentViewController(alertController, animated: true, completion: nil)
    
            // Prevent this segue firing
            return false
        }
        
        // For other segues, go ahead! :D
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Right before firing showCalculatedResults segue
        if(segue.identifier == "showCalculatedResults") {
            // Get the target view controller from the segue
            var showCalculatedResultsViewController: ShowCalculatedResultViewController = segue.destinationViewController as ShowCalculatedResultViewController
            
            // Pass the data into the target view controller in order to calculate the total bill
            showCalculatedResultsViewController.preTaxedBill = preTaxedBillField.text.bridgeToObjectiveC().floatValue
            showCalculatedResultsViewController.tip = tipField.text.bridgeToObjectiveC().floatValue
            
            // Now the segue should be fired up at this point!
        }
    }
}

