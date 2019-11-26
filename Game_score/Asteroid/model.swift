//
//  model.swift
//  Asteroid
//
//  Created by Rosh Sugathan Thaivalappil on 11/18/19.
//  Copyright © 2019 Rosh Sugathan Thaivalappil. All rights reserved.
//

import Foundation

struct model: Decodable
{
    let game: String
    let player: String
    let score: String
    
    init(dictionary: [String: Any]) {
        self.game = dictionary["game"] as? String ?? ""
        self.player = dictionary["player"] as? String ?? ""
        self.score = dictionary["score"] as? String ?? ""
    }
}
