//
//  ContactDetailViewController.swift
//  sample-mvvm-uikit
//
//  Created by Thuan Nguyen on 11/04/2023.
//

import UIKit

final class ContactDetailViewController: UIViewController {
    
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    
    public var viewModel: ContactDetailViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        title = viewModel.contact?.name
        phoneNumberLabel.text = viewModel.contact?.phoneNumber
    }
}
