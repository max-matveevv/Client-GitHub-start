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
    var avatarUrl: String?
    var forksCount: Int?
    var watchesCount: Int?
    
    init?(json: JSON) {
        id = "id" <~~ json
        name = "name" <~~ json
        description = "description" <~~ json
        isPrivate = "private" <~~ json
        avatarUrl = "avatar_url" <~~ json
        forksCount = "forks_count" <~~ json
        watchesCount = "watchers_count" <~~ json
    }
}
