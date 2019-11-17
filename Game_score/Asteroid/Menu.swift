//
//  Menu.swift
//  Asteroid
//
//  Created by Rosh Sugathan Thaivalappil on 11/16/19.
//  Copyright © 2019 Rosh Sugathan Thaivalappil. All rights reserved.
//

import SpriteKit

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
                let game = GameScene(size: self.size)
                self.view?.presentScene(game)
            }
        }
    }
}
