//
//  FirstViewController.swift
//  TheContact
//
//  Created by Sam on 18/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var tbvContacts: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    private var contacts = [Contact]()
    
    var selectedIndex:Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tbvContacts.delegate = self
        tbvContacts.dataSource = self
        contacts = ContactsDB.instance.selectContact()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        contacts = ContactsDB.instance.selectContact()
        tbvContacts.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController) {
        contacts = ContactsDB.instance.selectContact()
        tbvContacts.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do stuff
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:myCell = self.tbvContacts.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! myCell
        cell.lblNameSurname.text = "\(contacts[indexPath.row].name) \(contacts[indexPath.row].surname)"
        cell.lblPhone.text = contacts[indexPath.row].phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") {
            action, index in
            var id = self.contacts[indexPath.row].id
            self.selectedIndex = indexPath.row
            let object = self.contacts[index.row]
            self.performSegue(withIdentifier: "mySegue", sender: object)
        }
        edit.backgroundColor = UIColor.black
        
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            var id = self.contacts[indexPath.row].id
            self.deleteContact(id: id! )
        }
        delete.backgroundColor = UIColor.red
        
        return [delete,edit]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let viewController : SecondViewController = segue.destination as! SecondViewController
            viewController.popoverPresentationController!.delegate = self
            viewController.preferredContentSize = CGSize(width: 340, height: 600)
            viewController.contact = sender as! Contact
        }
    }
    
    
    func deleteContact(id: Int64) {
        ContactsDB.instance.deleteContact(did: id)
        contacts = ContactsDB.instance.selectContact()
        tbvContacts.reloadData()
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return UIModalPresentationStyle.none
    }
    
}

class myCell: UITableViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblNameSurname: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
}



