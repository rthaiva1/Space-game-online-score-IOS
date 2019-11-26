//
//  viewscore.swift
//  Asteroid
//
//  Created by Rosh Sugathan Thaivalappil on 11/25/19.
//  Copyright © 2019 Rosh Sugathan Thaivalappil. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class viewscore: SKScene{
    
    override func didMove(to view: SKView)
    {
        var list : [model] = []
        let winner = SKLabelNode(fontNamed: "Chalkduster")
        winner.text = "Winner's Board"
        winner.fontSize = 100
        winner.fontColor = SKColor.green
        winner.position = CGPoint(x: frame.midX, y: frame.midY)

         guard let urlpath = URL(string: "https://cs.binghamton.edu/~pmadden/courses/441score/getscores.php") else{
                      return
                  }
                          URLSession.shared.dataTask(with: urlpath){ (data, response , error) in
                              if response != nil{
                                print(response as Any)
                              }
                              
                              if let data = data{
                                  print(data)
                                  do{
                                    let json = try JSONSerialization.jsonObject(with: data) as? [[String: String]]
                                    for case let datalist in json! {
                                        let player = model(dictionary: datalist)
                                        list.append(player)
                                  }
                                  } catch {
                                      print(error)
                                  }
                              }
                          }.resume()
                                                print(list)
    }
}
