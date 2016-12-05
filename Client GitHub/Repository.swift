//
//  Repository.swift
//  Client GitHub
//
//  Created by Mikhail on 05.12.16.
//  Copyright © 2016 Max. All rights reserved.
//

import UIKit
import Gloss

final class Repository: Decodable {
    var id: Int?
    var name: String?
    var description: String?
    var isPrivate: Bool?
    
    
    init?(json: JSON) {
        id = "id" <~~ json
        name = "name" <~~ json
        description = "description" <~~ json
        isPrivate = "private" <~~ json
    }
}
