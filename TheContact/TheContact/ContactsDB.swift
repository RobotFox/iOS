//
//  ContactsDB.swift
//  TheContact
//
//  Created by Sam on 18/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import SQLite

class ContactsDB {
    
    static let instance = ContactsDB()
    
    private let db: Connection?
    
    private let contacts = Table("contacts")
    private let id = Expression<Int64>("id")
    private let surname = Expression<String>("surname")
    private let name = Expression<String>("name")
    private let phone = Expression<String>("phone")
    
    
    private init(){
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do{
            db = try Connection("\(path)/ContactsDB.sqlite3")
        }
        catch {
            db=nil
            //TODO inserire alert
        }
        
        createTable()
        
    }
    
    func createTable()
    {
        do {
            try db!.run(contacts.create(ifNotExists: true) {
                table in
                table.column(id,primaryKey:true)
                table.column(surname)
                table.column(name)
                table.column(phone)
            })
        }
        
        catch{
            //TODO inserire alert
        }
        
    }
    
    func insertContact(dsurname: String,dname:String,dphone:String) -> Int64? {
        
        do{
            let insert = contacts.insert(surname <- dsurname, name <- dname, phone <- dphone)
            
            let id = try db!.run(insert)
            
            return id
        }
        
        catch{
            //TODO inserire alert
            return -1
        }
    }
    
    func selectContact() -> [Contact] {
        var contacts = [Contact]()
        
        do{
            for contact in try
                db!.prepare(self.contacts){
                    contacts.append(Contact(id: contact[id], name: contact[name], surname: contact[surname], phone: contact[phone]))
            }
        }
        catch{
            //TODO inserire allert
        }
        
        return contacts
    }
    
    func deleteContact(did:Int64) -> Bool {
        
        do {
            let contact = contacts.filter(id==did)
            
            try db!.run(contact.delete())
            return true
        }
        catch{
            //TODO inserire allert
            return false
        }
        
    }
    
    
    func updateContact(did:Int64, newContact:Contact) -> Bool {
        
        let contact = contacts.filter(id == did)
        
        do{
            let update = contact.update([name <- newContact.name, surname <- newContact.surname, phone <- newContact.phone])
            
            if try db!.run(update)>0 {
                return true
            }
        }
        catch{
            //TODO inserire allert
        }
        return false
    }
}
