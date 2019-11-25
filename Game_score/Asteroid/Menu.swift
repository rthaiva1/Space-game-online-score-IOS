//
//  Menu.swift
//  Asteroid
//
//  Created by Rosh Sugathan Thaivalappil on 11/16/19.
//  Copyright © 2019 Rosh Sugathan Thaivalappil. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class Menu: SKScene
{
    var star:SKEmitterNode!
    var newgame:SKSpriteNode!
    
    override func didMove(to view: SKView)
    {
        newgame = self.childNode(withName: "NewGame") as? SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self)
        {
            let nodesArray = self.nodes(at: location )
            
            if nodesArray.first?.name == "NewGame"
            {
                if let scene = GKScene(fileNamed: "GameScene") {
                
                    if let sceneNode = scene.rootNode as! GameScene? {
                        sceneNode.scaleMode = .aspectFill
                        
                        // Present the scene
                        if let view = self.view {
                            view.presentScene(sceneNode)
                            
                            view.ignoresSiblingOrder = true
                            
                            view.showsFPS = true
                            view.showsNodeCount = true
                        }
                    }
                }
            }
            if nodesArray.first?.name == "HighScore"
            {
                //todo
                guard let urlpath = URL(string: "https://cs.binghamton.edu/~pmadden/courses/441score/getscores.php") else{
                    return
                }
                        let urlsession = URLSession.shared
                        URLSession.shared.dataTask(with: urlpath){ (data, response , error) in
                            if response != nil{
                                print(response)
                            }
                            
                            if let data = data{
                                print(data)
                                do{
                                let json = try JSONSerialization.jsonObject(with: data, options: [])
                                print(json)
                                } catch {
                                    print(error)
                                }
                            }
                        }.resume()
            }
        }
    }
}
