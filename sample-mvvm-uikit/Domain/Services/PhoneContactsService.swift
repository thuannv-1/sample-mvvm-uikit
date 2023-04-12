//
//  PhoneContactsService.swift
//  sample-mvvm-uikit
//
//  Created by Thuan Nguyen on 11/04/2023.
//

import Foundation
import ContactsUI

struct PhoneContactsService {
    
    static let shared = PhoneContactsService()
    
    func getContacts() -> [Contact] {
        var contacts = [Contact]()
        let contactStore = CNContactStore()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: keys)
        do {
            try contactStore.enumerateContacts(with: request) { (contact, stop) in
                for phoneNumber in contact.phoneNumbers {
                    let number = phoneNumber.value.stringValue
                    contacts.append(Contact(familyName: contact.familyName,
                                            givenName: contact.givenName,
                                            phoneNumber: number))
                }
            }
        } catch {
            print("Error loading contacts: \(error.localizedDescription)")
        }
        return contacts
    }
}
