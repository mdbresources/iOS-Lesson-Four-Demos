//
//  FavoritesVC.swift
//  NotificationCenterVsDelegation
//
//  Created by Patrick Yin on 2/25/20.
//  Copyright © 2020 Patrick Yin. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController, UITableViewDataSource, UITableViewDelegate, PeopleVCDelegate {
    
    var favorites: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PersonCell") as! PersonCell
        cell.name.text = self.favorites[indexPath.row]
        return cell
    }
    
    func itemChecked(_ item: String) {
        self.favorites.append(item)
        self.tableView.reloadData()
    }
    
    func itemUnchecked(_ item: String) {
        self.favorites = self.favorites.filter({$0 != item})
        self.tableView.reloadData()
    }
}
