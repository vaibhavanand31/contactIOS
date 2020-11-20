//
//  Contacts.swift
//  Contacts
//
//  Created by Vaibhav Anand on 2020-11-18.
//

import Foundation

class Contacts {
    var allContacts = [Person]()
    
    init() {
        if let archivedContacts = NSKeyedUnarchiver.unarchiveObject(withFile: contactsArchieveURL.path) as? [Person]{
            allContacts = archivedContacts
        }
    }
    
    let contactsArchieveURL:URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("contacts.archive")
    }()
    
    func createContact(name: String, phoneNumber: Int){
        allContacts.append(Person(name: name, phoneNumber: phoneNumber))
    }
    
    func saveChanges() -> Bool {
        return NSKeyedArchiver.archiveRootObject(allContacts, toFile: contactsArchieveURL.path)
    }
}
