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
                        if let scene = GKScene(fileNamed: "HighScore") {
                       
                           if let sceneNode = scene.rootNode as! viewscore? {
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
        }
    }
}
