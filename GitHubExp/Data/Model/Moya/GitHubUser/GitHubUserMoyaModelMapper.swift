//
//  GitHubUserModelMapper.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import Foundation

class GitHubUserModelMapper {
    func mapOrNil(from: GitHubUserMoyaModel) -> GitHubUser? {
        guard let id = from.id,
            let login = from.login,
            let avatarUlr = from.avatarUrl else {
                return nil
        }
        
        return GitHubUser(id: id,
                          login: login,
                          avatarUrl: avatarUlr)
    }
}
