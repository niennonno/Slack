//
//  ViewController.swift
//  Slack
//
//  Created by Aditya Vikram Godawat on 15/02/16.
//  Copyright © 2016 Wow Labz. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var username: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        username.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
    
        let paddingView = UIView(frame: CGRectMake(0, 0, 15, self.username.frame.height))
        username.leftView = paddingView
        
        username.delegate = self
//        username.rightView = slackLabel
        username.leftViewMode = UITextFieldViewMode.Always
    
        username.rightViewMode = UITextFieldViewMode.WhileEditing
        
    }
    
    override func viewDidLayoutSubviews() {

        let border = CALayer()
        let width = CGFloat(1.5)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: username.frame.size.height - width, width:  username.frame.size.width, height: username.frame.size.height)
        
        border.borderWidth = width
        username.layer.addSublayer(border)
        username.layer.masksToBounds = true
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        performSegueWithIdentifier("next", sender: self)
        
        return true
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

