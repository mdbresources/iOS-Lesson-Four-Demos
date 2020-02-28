//
//  MainVC-TableView.swift
//  MemeGenerator
//
//  Created by Patrick Yin on 2/27/20.
//  Copyright © 2020 Patrick Yin. All rights reserved.
//

import UIKit
import Foundation

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell", for: indexPath) as! MemeCell
        cell.name.text = memes[indexPath.row].name
        
        let url = URL(string: memes[indexPath.row].url)
        let data = try? Data(contentsOf: url!)
        cell.memeImage.image = UIImage(data: data!)
        
        return cell
    }
}
