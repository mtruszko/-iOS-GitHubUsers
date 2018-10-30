//
//  GitHubUserMoyaRepository.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import Moya
import RxSwift

class GitHubUserMoyaRepository: MoyaRepository<GitHubUser, UsersMoyaAPI> {
    override func query(specification: Specification) -> Observable<[GitHubUser]> {
        return (specification as! GitHubUserMoyaSpecification)
            .getResults(moyaProvider)
            .map({ gitHubUserMoyaModel -> [GitHubUser] in
                return [GitHubUser]()
            })
            .asObservable()
    }
}
