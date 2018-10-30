//
//  GitHubUserAssembly.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import Swinject

extension DIConstants {
    struct GutHubUser {
        static let repository = "GitHubUserRepository"
        static let specification = "GitHubUserSpecification"
    }
}

class GitHubUserAssembly: Assembly {
    func assemble(container: Container) {
        container
            .register(AnyRepository<GitHubUser>.self,
                      name: DIConstants.GutHubUser.repository) { _ in
                        return AnyRepository(entityType: GitHubUserMoyaRepository()) }
        container
            .register(Specification.self,
                      name: DIConstants.GutHubUser.specification) { _ in
                        return GitHubUserMoyaSpecification() }
    }
}
