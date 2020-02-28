//
//  Meme.swift
//  MemeGenerator
//
//  Created by Patrick Yin on 2/27/20.
//  Copyright © 2020 Patrick Yin. All rights reserved.
//

import Foundation

class MemeRequest: Decodable {
    let success: Bool
    let memes: [Meme]
    
    enum CodingKeys:String, CodingKey {
        case success, data
    }
    
    enum DataKeys: String, CodingKey {
        case memes
    }

    
    required init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.success = try valueContainer.decode(Bool.self, forKey: .success)
        
        let memeContainer = try valueContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        
        self.memes = try memeContainer.decode([Meme].self, forKey: .memes)
    }
}

struct Meme: Decodable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let box_count: Int
}
