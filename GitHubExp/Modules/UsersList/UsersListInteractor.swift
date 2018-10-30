//
//  UsersListInteractor.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import Moviper
import RxSwift

class UsersListInteractor: BaseRxInteractor, UsersListContractInteractor {
    
    let gitHubUserRepository: AnyRepository<GitHubUser> =
        assembler
            .get(name: DIConstants.GutHubUser.repository)
    let gitHubUserSpecification: Specification =
        assembler
            .get(name: DIConstants.GutHubUser.specification)
    
    func getGitHubUsers() -> Observable<[GitHubUser]> {
        return gitHubUserRepository
            .query(specification: gitHubUserSpecification)
    }
}
