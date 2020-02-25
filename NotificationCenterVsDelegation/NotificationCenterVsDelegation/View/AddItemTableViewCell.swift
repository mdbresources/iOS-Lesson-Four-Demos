//
//  AddItemTableViewCell.swift
//  NotificationCenterVsDelegation
//
//  Created by Patrick Yin on 2/25/20.
//  Copyright © 2020 Patrick Yin. All rights reserved.
//

import Foundation
import UIKit

protocol AddCellOwner {
    func addItem(_ item: String)
}

class AddItemTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    var owner: AddCellOwner?
    
    @IBAction func addPressed(_ sender: Any) {
        if let text = self.textField.text, text != "" {
            self.owner?.addItem(text)
            self.textField.text = ""
        }
        self.textField.resignFirstResponder()
    }
}
