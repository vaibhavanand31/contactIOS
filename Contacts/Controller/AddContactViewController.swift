//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Vaibhav Anand on 2020-11-18.
//

import UIKit

class AddContactViewController: UIViewController {
   
    var contacts: Contacts!;

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!    
    @IBAction func addContact(_ sender: Any) {
        if (name.text != "" && phoneNumber.text != "") {
            contacts.createContact(name: name.text!, phoneNumber: Int(phoneNumber.text!)!)
            _ = navigationController?.popViewController(animated: true)
        } else { return }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
