//
//  OnboardingViewController.swift
//  Slack
//
//  Created by Aditya Vikram Godawat on 15/02/16.
//  Copyright © 2016 Wow Labz. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    let imageArray = ["1.png", "2.png", "3.png"]
    var counter = 0
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let v = UISwipeGestureRecognizer(target: self, action: "changeImage:")
        v.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(v)
    
        let w = UISwipeGestureRecognizer(target: self, action: "changeImage:")
        w.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(w)
        
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func changeImage(gesture: UIGestureRecognizer){
        
        if let swipe = gesture as? UISwipeGestureRecognizer {
            
            switch(swipe.direction) {
                
            case UISwipeGestureRecognizerDirection.Left:
                
                self.counter++
               
                if self.counter == 3 {
                
                    counter = 2
                    performSegueWithIdentifier("nextScreen", sender: self)
                    
                } else {
                    
                    imageView.image = UIImage(named: imageArray[counter])
                    
                }
                
                
                print("Left Swipe")
                break
                
            case UISwipeGestureRecognizerDirection.Right:
                
                print("Right Swipe")

                if counter > 0 {
                    
                    --counter
                    imageView.image = UIImage(named: imageArray[counter])
                }
                
            default:
                break;
            }
            
        }
        
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
