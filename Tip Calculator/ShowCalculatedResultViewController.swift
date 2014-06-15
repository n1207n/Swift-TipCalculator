//
//  ShowCalculatedResultViewController.swift
//  Tip Calculator
//
//  Created by Silin Na on 6/14/14.
//  Copyright (c) 2014 Silin Na. All rights reserved.
//

import UIKit

class ShowCalculatedResultViewController: UIViewController {
    @IBOutlet var totalBill : UILabel
    @IBOutlet var backNavigationButton : UIBarButtonItem
    
    let tipResultTitle = "Looks like..."
    var preTaxedBill: Float?
    var tip: Float?
    var tipResultMessage: String?
    var tipResultResponse: String?

    @IBAction func clickBackNavigationButton(sender : UIBarButtonItem) {
        self.navigationController.popToRootViewControllerAnimated(true)
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalBill.text = "$" + NSString(format: "%.2f", preTaxedBill! + tip!)
    }
    
    override func viewDidAppear(animated: Bool) {
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
        
        let alertController = UIAlertController(title: tipResultTitle, message: tipResultMessage, preferredStyle: UIAlertControllerStyle.ActionSheet)
        alertController.addAction(UIAlertAction(title: tipResultResponse, style: UIAlertActionStyle.Default, handler: nil))
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
