//
//  PeopleVC.swift
//  NotificationCenterVsDelegation
//
//  Created by Patrick Yin on 2/25/20.
//  Copyright © 2020 Patrick Yin. All rights reserved.
//

import UIKit

protocol PeopleVCDelegate {
    func itemChecked(_ item: String)
    func itemUnchecked(_ item: String)
}

class PeopleVC: UIViewController, UITableViewDataSource, UITableViewDelegate, AddCellOwner {
    
    var people: [String] = ["Rini", "Maggie", "Olivia", "Juliet", "Nick", "James", "Ian", "Michael", "Geo", "Colin", "Patrick", "Anmol", "Melanie", "Niky"]
    var selected: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    var delegate: PeopleVCDelegate?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self.tabBarController?.viewControllers?[0] as? PeopleVCDelegate
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 300, right: 0)
        self.tableView.contentInset = contentInsets;
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.contentInset = contentInsets;
    }
    
    // AddCellOwner protocol function
    func addItem(_ item: String) {
        self.people.append(item)
        self.selected.append(false)
        self.tableView.reloadData()
    }
    
    // Table view logic
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != self.people.count {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
            cell.name.text = self.people[indexPath.row]
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath) as! AddItemTableViewCell
 
            cell.owner = self as? AddCellOwner
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == self.people.count {
            return
        }
        
        self.selected[indexPath.row] = !self.selected[indexPath.row]
        
        if self.selected[indexPath.row] {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            self.delegate?.itemChecked(self.people[indexPath.row])
        } else {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .none
            self.delegate?.itemUnchecked(self.people[indexPath.row])
        }
    }
}
