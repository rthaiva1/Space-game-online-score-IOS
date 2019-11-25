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
         guard let urlpath = URL(string: "https://cs.binghamton.edu/~pmadden/courses/441score/getscores.php") else{
                      return
                  }
                          let urlsession = URLSession.shared
                          URLSession.shared.dataTask(with: urlpath){ (data, response , error) in
                              if response != nil{
                                print(response as Any)
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
