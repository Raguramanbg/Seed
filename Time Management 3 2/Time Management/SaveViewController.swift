//
//  SaveViewController.swift
//  Time Management
//
//  Created by Raguraman Balaji on 23/5/17.
//  Copyright © 2017 Raguraman Balaji. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    var task = String()
    var unit = String()
    var Weights = String()
    var marks = String()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = task
        
        label2.text = unit
        
        label3.text = Weights

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
