//
//  HomeViewModel.swift
//  sample-mvvm-uikit
//
//  Created by Thuan Nguyen on 11/04/2023.
//

import Foundation

struct HomeViewModel {
    
}

extension HomeViewModel {
    
    // Get contact from system
    func getContacts() -> [Contact] {
        let mockContacts: [Contact] = [
            .init(name: "Thuan", phoneNumber: "0124555123"),
            .init(name: "Phuong", phoneNumber: "099123131")
        ]
        return mockContacts
    }
}
