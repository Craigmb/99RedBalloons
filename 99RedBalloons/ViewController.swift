//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Mike on 9/8/15.
//  Copyright (c) 2015 Mike Craig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balloonLabel: UILabel!
    @IBOutlet weak var balloonImageView: UIImageView!
    
    var currentRandomNumber = 0
    var currentIndex = 0
    var myBalloons:[Balloon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var randomIndex = 0
        var x = 0
        var imageName = ""
        
        var newBalloon = Balloon()
        newBalloon.number = 0
        newBalloon.image = UIImage(named: "")
        currentIndex = 1
        
        while x < 100 {
            let randomIndex = Int(arc4random_uniform(UInt32(4)))
            switch (randomIndex){
            case 0: imageName = "RedBalloon1.jpg"
            case 1: imageName = "RedBalloon2.jpg"
            case 2: imageName = "RedBalloon3.jpg"
            case 3: imageName = "RedBalloon4.jpg"
            default: imageName = "RedBalloon1.jpg"
            }
            
            newBalloon.number = x
            newBalloon.image = UIImage(named: imageName)
            myBalloons.append(newBalloon)
            x = x + 1
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
       
        
    let aBalloon = myBalloons[self.currentIndex]
        self.currentIndex++
        if self.currentIndex == 100 {
            self.currentIndex = 0
        }

        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:
            {
            self.balloonImageView.image = aBalloon.image
            self.balloonLabel.text = "\(aBalloon.number) Balloons"
            }, completion: { (finished: Bool) -> () in
            })
        }
}