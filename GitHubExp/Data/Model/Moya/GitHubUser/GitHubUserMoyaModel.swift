//
//  GitHubUserModel.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import Foundation
import Mapper

struct GitHubUserMoyaModel: Mappable {
    let id: Int?
    let login: String?
    let avatarUrl: String?
    
    init(map: Mapper) throws {
        id = map.optionalFrom("id")
        login = map.optionalFrom("login")
        avatarUrl = map.optionalFrom("avatar_url")
    }
}
