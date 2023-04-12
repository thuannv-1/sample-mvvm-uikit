//
//  ContactHeaderView.swift
//  sample-mvvm-uikit
//
//  Created by Thuan Nguyen on 12/04/2023.
//

import UIKit

final class ContactHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var sectionCharLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configView(char: String) {
        sectionCharLabel.text = char
    }
}
