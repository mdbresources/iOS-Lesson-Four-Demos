//
//  Meme.swift
//  MemeGenerator
//
//  Created by Patrick Yin on 2/27/20.
//  Copyright © 2020 Patrick Yin. All rights reserved.
//

import Foundation

struct MemeKeys: Decodable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let box_count: Int
}

struct MiddleMemeKey: Decodable {
    let memes: [MemeKeys]
}

struct OuterMemeKeys: Decodable {
    let success: Bool
    let data: MiddleMemeKey
}

