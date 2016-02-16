//
//  PasswordFirstViewController.swift
//  Slack
//
//  Created by Aditya Vikram Godawat on 16/02/16.
//  Copyright © 2016 Wow Labz. All rights reserved.
//

import UIKit

class PasswordFirstViewController: UIViewController {

    @IBOutlet var teamnameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        teamnameLabel.text = teamname + ".slack.com"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
