//
//  MainVC.swift
//  MemeGenerator
//
//  Created by Patrick Yin on 2/27/20.
//  Copyright © 2020 Patrick Yin. All rights reserved.
//

import Foundation
import UIKit


class MainVC: UIViewController {
    var memes: [Meme] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.getMemes {
            memes in
            
            self.memes = memes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

