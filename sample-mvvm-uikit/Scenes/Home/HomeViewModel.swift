//
//  HomeViewModel.swift
//  sample-mvvm-uikit
//
//  Created by Thuan Nguyen on 11/04/2023.
//

import Foundation

struct ContactSection {
    let char: String
    let contacts: [Contact]
}

struct HomeViewModel {
    
}

extension HomeViewModel {
    func getContacts() -> [ContactSection] {
        let allContact = PhoneContactsService.shared.getContacts()
        let alphabet = getAlphabet()
        
        var sections: [ContactSection] = alphabet.map { char in
            let matchContacts = allContact.filter { $0.givenName.first == String(char).first }
            print(matchContacts.count)
            return ContactSection(char: String(char),
                                  contacts: matchContacts)
        }
        sections.removeAll(where: { $0.contacts.isEmpty })
        return sections
    }
    
    func getAlphabet() -> [Unicode.Scalar] {
        var alphabet: [Unicode.Scalar] = []
        let initalAlphabet = Unicode.Scalar("A").value
        let endAlphabet = Unicode.Scalar("Z").value
        for k in initalAlphabet...endAlphabet {
            if let val = Unicode.Scalar(k) {
                alphabet.append(val)
            }
        }
        return alphabet
    }
}
