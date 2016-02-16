//
//  SignInViewController.swift
//  Slack
//
//  Created by Aditya Vikram Godawat on 16/02/16.
//  Copyright © 2016 Wow Labz. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
  
    @IBOutlet var teamnameLable: UILabel!
    @IBOutlet var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: self.view.window)
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        let mutableTeamName = NSMutableAttributedString(string: teamname)
        
        mutableTeamName.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location: 0, length: mutableTeamName.length))
        
        mutableTeamName.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(18), range: NSRange(location:0, length: mutableTeamName.length))
        
        let suffix = NSAttributedString(string: ".slack.com", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        mutableTeamName.appendAttributedString(suffix)
        
        teamnameLable.attributedText = mutableTeamName
    
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

    override func viewWillDisappear(animated: Bool) {
     
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: self.view.window)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func keyboardWillShow(sender: NSNotification) {
    
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        let offset: CGSize = userInfo[UIKeyboardFrameEndUserInfoKey]!.CGRectValue.size
        
        if keyboardSize.height == offset.height {
        
            UIView.animateWithDuration(0.1, animations: { () -> Void in
            
                self.view.frame.origin.y -= keyboardSize.height
            
            })
        
        } else {
        
            UIView.animateWithDuration(0.1, animations: { () -> Void in
            
                self.view.frame.origin.y += keyboardSize.height - offset.height
            
            })
        
        }
   
    }
    
    func keyboardWillHide(sender: NSNotification) {
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        self.view.frame.origin.y += keyboardSize.height
    }
    
}
