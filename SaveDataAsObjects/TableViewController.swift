//
//  TableViewController.swift
//  SaveDataAsObjects
//
//  Created by Saleh Omar Ahmed on 15/02/2022.
//

import UIKit
//1 My_Constant_a
class TableViewController: UITableViewController {
    
    var vUserArray = [My_Class_a_User_Info]()
    //Fiel Path and name
    let My_Constant_a_Data_File_Path =
    FileManager.default.urls(for:
    .documentDirectory,in:
    .userDomainMask)
    .first?
    .appendingPathComponent("my_Users.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(My_Constant_a_Data_File_Path!)
        fLoadUsers()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return vUserArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        let cCell = tableView.dequeueReusableCell(withIdentifier: "nc_a", for: indexPath)
        
        let cUser/*item*/ = vUserArray[indexPath.row]
        
        cCell.textLabel?.text = cUser.first_name
        
        //We're going to use the ternary operator.
        cCell.accessoryType = cUser.status ? .checkmark : .none

        return cCell
    }
    //Selected Row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vUserArray[indexPath.row].status = !vUserArray[indexPath.row].status
        fSaveUser()
        
        //The Higlt of selected cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func UIBarButtonItemAdd(_ sender: UIBarButtonItem){
        
        var vReceptorUITextField = UITextField()/** UITextField() an object that displays an editable text area in your interface.*/
        
        //MARK - AlertControl
        let cUIAlertController = UIAlertController(title: "New User", message: "Add user information", preferredStyle: .alert) /**UIAlertController() An object that displays an alert message to the user.*/
        
        let cUIAlertAction = UIAlertAction(title: "Submit", style: .default) {
            (_) in /**Submit button **/
            
            //Creat an object of My_Class_a_User_Info to give first_name property a value
            let cNewUser = My_Class_a_User_Info()
            cNewUser.first_name = vReceptorUITextField.text!
            //Add first name property to array
            self.vUserArray.append(cNewUser)
            self.fSaveUser()
        }
        
        cUIAlertController.addTextField {
            (clTextField) in
            clTextField.placeholder = "Add Name"
            vReceptorUITextField = clTextField /**vUITextField get the added text and send it out of alert **/
        }/**addTextField Adds a text field to an alert*/
        
        cUIAlertController.addAction(cUIAlertAction) /**addAction() Attaches an action object to the alert or action sheet.*/
        
        present(cUIAlertController, animated: true, completion: nil) /**cUIAlertController Presents a view controller modally.*/
        //End of MARK - AlertControl
    }
    
    //Save Method -> to save the updated content
    func fSaveUser() {
        let cEncoder = PropertyListEncoder() //An object that encodes instances of data types to a property list.
        do {
            let cData = try cEncoder.encode(vUserArray)
            try cData.write(to: My_Constant_a_Data_File_Path!)
        } catch {
            print(error)
        }
        tableView.reloadData()// Reload after ading user
    }
    
    func fLoadUsers() {
        if let cData = try? Data(contentsOf: My_Constant_a_Data_File_Path!){
            let cDecoder = PropertyListDecoder()
            do {
                vUserArray = try cDecoder.decode([My_Class_a_User_Info].self, from: cData)
            } catch {
                print(error)
            }
        }
    }
    
}
