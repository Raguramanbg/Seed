//
//  HomeViewController.swift
//  Time Management
//
//  Created by Raguraman Balaji on 23/5/17.
//  Copyright © 2017 Raguraman Balaji. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tasksTableView: UITableView!
    var isViewTasks: Bool = false
    var indexRow:NSInteger = -1

    let cellReuseIdentifier = "cell"
    var arrayTasks: [[String: AnyObject]] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        
        if UserDefaults.standard.array(forKey: "tasks") != nil {
            arrayTasks = UserDefaults.standard.array(forKey: "tasks")! as! [[String : AnyObject]]
        }
        tasksTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTaskAction(_ sender: Any) {
        
        isViewTasks = false
        indexRow = -1
        self.performSegue(withIdentifier: "show", sender: self)
    }

    // MARK:- TableView Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
            return arrayTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = arrayTasks[indexPath.row]["name"] as? String
        
        return cell
    }
    
    // MARK:- TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isViewTasks = true
        indexRow = indexPath.row
        self.performSegue(withIdentifier: "show", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! AddViewController
        destinationVC.isViewTasks = isViewTasks
        destinationVC.indexRow = indexRow
    }
}
