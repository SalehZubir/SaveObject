//
//  TableViewController.swift
//  SaveDataAsObjects
//
//  Created by Saleh Omar Ahmed on 15/02/2022.
//

import UIKit
//1 My_Constant_a
class TableViewController: UITableViewController {
    
    /*
    Crrate a file pathe to document folder
    let My_Constant_a_Data_File_Path = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask).first?.appendingPathComponent("my_Users.plist")
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         printing the path of document foleder
         print(My_Constant_a_Data_File_Path!)
         */
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    @IBAction func UIBarButtonItemAdd(_ sender: UIBarButtonItem){
        
        var vUITextField = UITextField()/** UITextField() an object that displays an editable text area in your interface.*/
        print(vUITextField.text!)
        
        let cUIAlertController = UIAlertController(title: "New User", message: "Add user information", preferredStyle: .alert) /**UIAlertController() An object that displays an alert message to the user.*/
        
        let cUIAlertAction = UIAlertAction(title: "Submit", style: .default) {
            (_) in /**Submit button **/
        }
        
        cUIAlertController.addTextField {
            (clTextField) in
            clTextField.placeholder = "Add Name"
            vUITextField = clTextField /**vUITextField get the added text and send it out of alert **/
        }/**addTextField Adds a text field to an alert*/
        
        cUIAlertController.addAction(cUIAlertAction) /**addAction() Attaches an action object to the alert or action sheet.*/
        present(cUIAlertController, animated: true, completion: nil) /**cUIAlertController Presents a view controller modally.*/
    }
    
}
