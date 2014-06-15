//
//  ShowCalculatedResultViewController.swift
//  Tip Calculator
//
//  Created by Silin Na on 6/14/14.
//  Copyright (c) 2014 Silin Na. All rights reserved.
//

import UIKit

class ShowCalculatedResultViewController: UIViewController {
    // IBOutlet variables
    @IBOutlet var totalBill : UILabel
    @IBOutlet var backNavigationButton : UIBarButtonItem
    
    // Class Constants
    let tipResultTitle = "Looks like..."
    
    // Class Variables
    var preTaxedBill: Float?
    var tip: Float?
    var tipResultMessage: String?
    var tipResultResponse: String?

    @IBAction func clickBackNavigationButton(sender : UIBarButtonItem) {
        // When the back button in the navigation controller is clicked
        // simply pop this view from the navigation stack to go back!
        self.navigationController.popToRootViewControllerAnimated(true)
    }
    
    // Initializer to stop Xcode's complaining
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Calculate the total bill without tax and update the totalBill text
        totalBill.text = "$" + NSString(format: "%.2f", preTaxedBill! + tip!)
    }
    
    // After the view is loaded and presented to the user
    override func viewDidAppear(animated: Bool) {
        // Create the message and possible response to the user based on the tip percentage
        switch (ceilf(tip!)) {

        case 0:
            tipResultMessage = "Looks like you had a bad service or are broke. :("
            tipResultResponse = "Whatever, man"
        
        case 1...9:
            tipResultMessage = "At least you gave them something! :p"
            tipResultResponse = "Yup!"
        
        case 10...14:
            tipResultMessage = "Was it so-so?"
            tipResultResponse = "Kinda"
        
        case 15:
            tipResultMessage = "Was it good?"
            tipResultResponse = "Sure!"
        
        case 16...19:
            tipResultMessage = "Was it great?"
            tipResultResponse = "Dude, it was!"
        
        case 20...25:
            tipResultMessage = "Sir/Madam, you are generous!"
            tipResultResponse = "Save it for later."
        
        case let x where x > 26:
            tipResultMessage = "I don't know what to say. You are rich!"
            tipResultResponse = "I know right?"
        
        default:
            tipResultMessage = "Hope you had a great meal!"
            tipResultResponse = "Thanks"
        }
        
        // Create a UIAlertController to display the tip result messages in ActionSheet style
        let alertController = UIAlertController(title: tipResultTitle, message: tipResultMessage, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        // Add the Action button for this alert controller
        alertController.addAction(UIAlertAction(title: tipResultResponse, style: UIAlertActionStyle.Default, handler: nil))
        
        // Present above alert controller to complement, cheer up, or bother the user
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
