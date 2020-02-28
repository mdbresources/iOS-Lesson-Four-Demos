//
//  APIManager.swift
//  MemeGenerator
//
//  Created by Anmol Parande on 2/28/20.
//  Copyright © 2020 Patrick Yin. All rights reserved.
//

import Foundation

class APIManager {
    static func getMemes(_ completion: @escaping ([Meme]) -> ()) {
        var request = URLRequest(url: URL(string: "https://api.imgflip.com/get_memes")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                //print(String(describing: error))
                return
            }
            
            guard let request = try? JSONDecoder().decode(MemeRequest.self, from: data) else {
                return
            }
            
            completion(request.memes)
        }
        
        task.resume()
    }
}
