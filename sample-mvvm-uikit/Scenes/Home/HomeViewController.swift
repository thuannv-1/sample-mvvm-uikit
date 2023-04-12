//
//  HomeViewController.swift
//  sample-mvvm-uikit
//
//  Created by Thuan Nguyen on 11/04/2023.
//

import UIKit
import ContactsUI

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: HomeViewModel = .init()
    
    private var dataSource = [ContactSection]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        loadContacts()
    }
    
    private func configView() {
        title = "Home"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ContactTableViewCell")
        tableView.register(UINib(nibName: "ContactHeaderView", bundle: nil),
                           forHeaderFooterViewReuseIdentifier: "ContactHeaderView")
    }
    
    private func loadContacts() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.dataSource = self.viewModel.getContacts()
        }
    }
    
    private func toContactDetail(contact: Contact) {
        var vm = ContactDetailViewModel()
        vm.contact = contact
        let vc = ContactDetailViewController()
        vc.viewModel = vm
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].contacts.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell",
                                                 for: indexPath) as! ContactTableViewCell
        let contact = dataSource[indexPath.section].contacts[indexPath.row]
        cell.configCell(contact: contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ContactHeaderView") as! ContactHeaderView
        let char = dataSource[section].char
        view.configView(char: char)
        return view
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let contact = dataSource[indexPath.section].contacts[indexPath.row]
        toContactDetail(contact: contact)
    }
}
