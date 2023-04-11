//
//  HomeViewController.swift
//  sample-mvvm-uikit
//
//  Created by Thuan Nguyen on 11/04/2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: HomeViewModel = .init()
    
    private var dataSource = [Contact]() {
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
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell",
                                                 for: indexPath) as! ContactTableViewCell
        cell.configCell(contact: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        toContactDetail(contact: dataSource[indexPath.row])
    }
}
