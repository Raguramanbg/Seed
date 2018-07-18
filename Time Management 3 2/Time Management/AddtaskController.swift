//
//  AddtaskController.swift
//  Time Management
//
//  Created by Raguraman Balaji on 23/5/17.
//  Copyright © 2017 Raguraman Balaji. All rights reserved.
//

import UIKit



class AddtaskController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var newtask: UITextField!
    
    @IBOutlet weak var unitc: UITextField!
    
    @IBOutlet weak var weig: UITextField!
    
    
    @IBOutlet weak var deadline: UITextField!
    
   
    @IBOutlet weak var Picker2: UIPickerView!
   
    var Array = ["Urgent & Important"," Not Urgent & Important","Urgent & Not Important","Not Urgent & Not Important"]
    
   
    @IBAction func pressed(_ sender: Any)
    
    {
        if (newtask.text != "" )
        {
        
        ntask = newtask.text!
        performSegue(withIdentifier: "wsave", sender: self)
        
        }
       
        if (unitc.text != "" )
        {
            
             unit = unitc.text!
            performSegue(withIdentifier: "wsave", sender: self)
            
        }
    
        if (weig.text != "" )
        {
            
            weight = weig.text!
            performSegue(withIdentifier: "wsave", sender: self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
     var savedcontroller = segue.destination as! Savedtaskviewcontroller
        savedcontroller.taskname = textfield.text
    }
    
        override func viewDidLoad()
        {
        super.viewDidLoad()

         Picker2.delegate = self
       
         Picker2.dataSource = self
       
        // Do any additional setup after loading the view.
    }

    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array[row]
    }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Array.count
    }
 
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    
}

