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
    var memes: [MemeKeys] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateMemes()
    }

    func generateMemes() {
        
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "https://api.imgflip.com/get_memes")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            //print(String(describing: error))
            return
          }
          //print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
            
            let memeOuter = try! JSONDecoder().decode(OuterMemeKeys.self, from: data)
            self.memes = memeOuter.data.memes
            self.tableView.reloadData()
            
        }

        task.resume()
        semaphore.wait()
    }
}

