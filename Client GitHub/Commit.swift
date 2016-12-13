//
//  Commit.swift
//  Client GitHub
//
//  Created by Max on 14.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit
import Gloss

final class Commit: Decodable {

    var commit: String?
    
    init?(json: JSON) {
        
        commit = "commit" <~~ json
    }
}
