//
//  SecondViewController.swift
//  TheContact
//
//  Created by Sam on 18/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtSurname: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    var contact:Contact?
    
    var toUpdate:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let test = contact {
            txtName.text = contact?.name
            txtSurname.text = contact?.surname
            txtPhone.text = contact?.phone
            toUpdate = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let test = contact {
            txtName.text = contact?.name
            txtSurname.text = contact?.surname
            txtPhone.text = contact?.phone
            toUpdate = true
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSave_TouchUpInside(_ sender: UIButton) {
        
        if((txtName.text?.isEmpty)!||(txtSurname.text?.isEmpty)!||(txtPhone.text?.isEmpty)!){
            //TODO inserire allert
        }
        else{
            if toUpdate {
                var contactUpdate = Contact(id: (contact?.id)!, name: txtName.text!, surname: txtSurname.text!, phone: txtPhone.text!)
                
                let isUpdate = ContactsDB.instance.updateContact(did: (contact?.id)!, newContact: contactUpdate)
                if isUpdate {
                 print("aggiornato")
                    txtName.text?.removeAll()
                    txtSurname.text?.removeAll()
                    txtPhone.text?.removeAll()
                }
                else{
                    print("non aggiornato")
                }
                
            }
            else{
                let contactNew: Contact = Contact(id: 0)
                contactNew.name = txtName.text!
                contactNew.surname = txtSurname.text!
                contactNew.phone = txtPhone.text!
                let isCreate = ContactsDB.instance.insertContact(dsurname: contactNew.surname, dname: contactNew.name, dphone: contactNew.phone)
                if (isCreate != nil) {
                    //TODO allert
                    print("Inserito")
                    txtName.text?.removeAll()
                    txtSurname.text?.removeAll()
                    txtPhone.text?.removeAll()
                }
                else{
                    //TODO allert
                    print("Non inserito")
                }
            }
            
            
            
        }
    }

}

