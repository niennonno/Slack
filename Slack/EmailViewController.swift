//
//  EmailViewController.swift
//  Slack
//
//  Created by Aditya Vikram Godawat on 16/02/16.
//  Copyright © 2016 Wow Labz. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        let paddingView = UIView(frame: CGRectMake(0, -150, 0, self.emailTextField.frame.height))
        emailTextField.leftView = paddingView
        emailTextField.leftViewMode = UITextFieldViewMode.Always

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        let border = CALayer()
        let width = CGFloat(1.5)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: emailTextField.frame.size.height - width, width:  emailTextField.frame.size.width, height: emailTextField.frame.size.height)
        
        border.borderWidth = width
        emailTextField.layer.addSublayer(border)
        emailTextField.layer.masksToBounds = true
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
