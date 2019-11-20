//
//  url.swift
//  Asteroid
//
//  Created by Rosh Sugathan Thaivalappil on 11/19/19.
//  Copyright © 2019 Rosh Sugathan Thaivalappil. All rights reserved.
//

import Foundation

protocol urlprotocol: class {
    
}

class url: NSObject, URLSessionDataDelegate {
    weak var delegate : urlprotocol!
 
    let urlpath: String = "http://cs.binghamton.edu/~pmadden/courses/441score/getscores.php"
}
