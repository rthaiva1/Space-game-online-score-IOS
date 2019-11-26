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
        let title = SKLabelNode(fontNamed: "Chalkduster")
        title.text = "Score Board"
        title.fontSize = 100
        title.fontColor = SKColor.black
        title.position = CGPoint(x: frame.midX, y: frame.height/2-100)
        addChild(title)
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
                                  displaylist();
                                  } catch {
                                      print(error)
                                  }
                              }
                          }.resume()
        func displaylist(){
            var i = frame.height/2-300
            var j = frame.height/2-300
            var k = frame.height/2-300
            let heading1 = SKLabelNode(fontNamed: "Chalkduster")
            heading1.text = "Game"
            heading1.fontSize = 40
            heading1.fontColor = SKColor.black
            heading1.position = CGPoint(x: frame.midX-300, y: i+40)
            addChild(heading1)
            let heading2 = SKLabelNode(fontNamed: "Chalkduster")
            heading2.text = "Player"
            heading2.fontSize = 40
            heading2.fontColor = SKColor.black
            heading2.position = CGPoint(x: frame.midX, y: j+40)
            addChild(heading2)
            let heading3 = SKLabelNode(fontNamed: "Chalkduster")
            heading3.text = "Score"
            heading3.fontSize = 40
            heading3.fontColor = SKColor.black
            heading3.position = CGPoint(x: frame.midX+300, y: k+40)
            addChild(heading3)
            for items in list
            {
                let temp1 = SKLabelNode(fontNamed: "Chalkduster")
                let temp2 = SKLabelNode(fontNamed: "Chalkduster")
                let temp3 = SKLabelNode(fontNamed: "Chalkduster")
                temp1.text = items.game
                temp1.fontSize = 30
                temp1.fontColor = SKColor.black
                temp1.position = CGPoint(x: frame.midX-300, y: i)
                temp2.text = items.player
                temp2.fontSize = 30
                temp2.fontColor = SKColor.black
                temp2.position = CGPoint(x: frame.midX, y: j)
                temp3.text = items.score
                temp3.fontSize = 30
                temp3.fontColor = SKColor.black
                temp3.position = CGPoint(x: frame.midX + 300, y: k)
                i = i - 40
                j = j - 40
                k = k - 40
                addChild(temp1)
                addChild(temp2)
                addChild(temp3)
            }
            print(list[1].game)
        }
    }
}
