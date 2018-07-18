//
//  AddViewController.swift
//  Time Management
//
//  Created by Raguraman Balaji on 23/5/17.
//  Copyright © 2017 Raguraman Balaji. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate {
    
    var isViewTasks: Bool = false
    var indexRow:NSInteger = -1
    
    var arrayTasks: [[String: AnyObject]] = []
    
    @IBOutlet weak var tname: UITextField!
    @IBOutlet weak var code: UITextField!
    
    
    @IBOutlet weak var Mark: UITextField!
    
    @IBOutlet weak var weigtageOutlet: UIButton!
    @IBOutlet weak var deadLineOutlet: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var saveOutlet: UIButton!
    @IBOutlet weak var cancelOutlet: UIButton!
    @IBOutlet weak var deleteOutlet: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    var selectedDate:String!
    var selectedWeightage:String!
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDate()
        // Do any additional setup after loading the view.
        
        if isViewTasks == true {
            self.updateTaskDetails()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTaskDetails() {
        
        arrayTasks = UserDefaults.standard.array(forKey: "tasks")! as! [[String : AnyObject]]
        tname.text = arrayTasks[indexRow]["name"] as? String
        Mark.text = arrayTasks[indexRow]["marks"] as? String
        code.text = arrayTasks[indexRow]["code"] as? String
        selectedWeightage = arrayTasks[indexRow]["weightage"] as? String
        selectedDate = arrayTasks[indexRow]["deadline"] as? String
        
        weigtageOutlet.setTitle(selectedWeightage, for: UIControlState.normal)
        deadLineOutlet.setTitle(selectedDate, for: UIControlState.normal)
        
        deleteOutlet.isHidden = false
        //        saveOutlet.isHidden = true
        //        cancelOutlet.isHidden = true
        
        titleLabel.text = "View / Edit Task"
    }
    
    // MARK: - Picker
    
    let important = ["Urgent & Important", " Not Urgent & Important", "Urgent & Not Important", "Not Urgent & Not Important"]
    
    
    @IBAction func weigtageAction(_ sender: Any) {
        datePicker.isHidden = true
        pickerView.isHidden = false
        tname.resignFirstResponder()
        Mark.resignFirstResponder()
        code.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return important[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return important.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedWeightage = important[row]
        weigtageOutlet.setTitle(selectedWeightage, for: UIControlState.normal)
    }
    
    // MARK:- Date Picker
    func setDate() {
        selectedDate = dateFormatter.string(from: datePicker.date)
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        deadLineOutlet.setTitle(selectedDate, for: UIControlState.normal)
    }
    @IBAction func deadLineAction(_ sender: Any) {
        datePicker.isHidden = false
        pickerView.isHidden = true
        tname.resignFirstResponder()
        Mark.resignFirstResponder()
        code.resignFirstResponder()
    }
    
    @IBAction func datePicker(_ sender: Any) {
        self.setDate()
    }
    
    // MARK:- TextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tname.resignFirstResponder()
        Mark.resignFirstResponder()
        code.resignFirstResponder()
        return true
    }
    
    // MARK: -  Button Action
    @IBAction func save(_ sender: Any)
    {
        
        if tname.text?.characters.count == 0 {
            return
        }
        if Mark.text?.characters.count == 0 {
            return
        }
        
        if code.text?.characters.count == 0 {
            return
        }
        
        if selectedWeightage.characters.count == 0 {
            return
        }
        
        if selectedDate.characters.count == 0 {
            return
        }
        if isViewTasks {    // Edit and save
            
            arrayTasks[indexRow]["name"] = tname.text as AnyObject
            arrayTasks[indexRow]["marks"] = Mark.text as AnyObject
            arrayTasks[indexRow]["code"] = code.text as AnyObject
            arrayTasks[indexRow]["weightage"] = selectedWeightage as AnyObject
            arrayTasks[indexRow]["deadline"] = selectedDate as AnyObject
            
            let defaults = UserDefaults.standard
            defaults.set(arrayTasks, forKey: "tasks")
            
        } else {    // Save a new task
            
            var taskDict = [String:String]()
            taskDict["name"] = tname.text
            taskDict["marks"] = Mark.text
            taskDict["code"] = code.text
            taskDict["weightage"] = selectedWeightage
            taskDict["deadline"] = selectedDate
            
            //        var array:Array<Any>!
            var array: [[String: AnyObject]] = []
            
            if UserDefaults.standard.array(forKey: "tasks") != nil {
                array = UserDefaults.standard.array(forKey: "tasks") as! [[String : AnyObject]]
                array.append(taskDict as [String : AnyObject])
            } else {
                array.append(taskDict as [String : AnyObject])
            }
            
            let defaults = UserDefaults.standard
            defaults.set(array, forKey: "tasks")
        }
        
        
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // MARK:- Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let savecontroller = segue.destination as! SaveViewController
        
        savecontroller.task = tname.text!
        savecontroller.marks = Mark.text!
        savecontroller.unit = code.text!
        savecontroller.Weights = (weigtageOutlet.titleLabel?.text!)!
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        
        arrayTasks.remove(at: indexRow)
        
        let defaults = UserDefaults.standard
        defaults.set(arrayTasks, forKey: "tasks")
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
