//
//  QuizController.swift
//  Time Management
//
//  Created by Raguraman Balaji on 16/5/17.
//  Copyright © 2017 Raguraman Balaji. All rights reserved.
//

import UIKit

class QuizController: UIViewController {
    
    let question=["1. Do you make a list of the things you have to do each day?","2. Do you plan your day before you start it?","3. Do you make a schedule of the activities you have to do on work days?","4. Do you write a set of goals for yourself for each day?","5. Do you spend time each day planning?","6. Do you have a clear idea of what you want to accomplish during the next week?","7. Do you set and honor priorities?"]
    let answer=[["Never","Rarely","Occasionally","Regularly","Always"],["Never","Rarely","Occasionally","Regularly","Always"],["Never","Rarely","Occasionally","Regularly","Always"],["Never","Rarely","Occasionally","Regularly","Always"],["Never","Rarely","Occasionally","Regularly","Always"],["Never","Rarely","Occasionally","Regularly","Always"],["Never","Rarely","Occasionally","Regularly","Always"]]
    
    
    //variables
    
    var cquestion = 0
    var ranswer:UInt32 = 0
    
    
    //label
    
    
    @IBOutlet weak var label: UILabel!
   
    //button

    @IBAction func action(_ sender: AnyObject)
    {
   if (sender.tag == Int (ranswer))
    {
        print("right")
       
   }
   
   else
   
   {
            print("wrong")
            
        }
        
        if ( cquestion != question.count)
            
            {
                newquestions()
                
        }
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        newquestions()
    }
    
    
    
    // function displays new quesition 
    
    func newquestions()
    {
        label.text=question[cquestion]
        ranswer = arc4random_uniform(3)+1
        //Create a Button
        
        var button:UIButton=UIButton()
        var x=1
        
        for i in 1...5
        {
            //creating a button
//            button = view.viewWithTag(i) as! UIButton
            if (i == Int(ranswer))
            {
//                button.setTitle(answer[cquestion][0], for: .normal)
            }
            else
            {
//                button.setTitle(answer[cquestion][x], for: .normal)
                x = 2
            }
     cquestion += 1
    }
    
    
    
        
    }
    }
