//
//  ContactTableViewCell.swift
//  sample-mvvm-uikit
//
//  Created by Thuan Nguyen on 11/04/2023.
//

import UIKit

final class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        nameLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func configCell(contact: Contact) {
        nameLabel.text = contact.familyName + " " + contact.givenName
        numberLabel.text = contact.phoneNumber
    }
}
