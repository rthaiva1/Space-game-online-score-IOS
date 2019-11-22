//
//  url.swift
//  Asteroid
//
//  Created by Rosh Sugathan Thaivalappil on 11/19/19.
//  Copyright © 2019 Rosh Sugathan Thaivalappil. All rights reserved.
//

import Foundation

class urlservice {
 
    let urlpath: String = "http://cs.binghamton.edu/~pmadden/courses/441score/getscores.php"
    func request(endpoint: String, parameters: [String: Any], completion: (Result<model, Error>) ->Void) {
    let url = URL(string: urlpath + endpoint)
    
    var request = URLRequest(url: url)
    
    var components = URLComponents()
    
    var queryItems = [URLQueryItem]()
   
    }
}
