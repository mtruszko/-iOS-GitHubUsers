//
//  GitHubMoyaUserSpecification.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import Moya
import RxSwift
import Moya_ModelMapper

class GitHubUserMoyaSpecification: MoyaSpecification<UsersMoyaAPI, GitHubUserMoyaModel> {
    override func getResults(_ moyaProvider: MoyaProvider<UsersMoyaAPI>) -> Single<GitHubUserMoyaModel> {
        return moyaProvider.rx
            .request(.users)
            .map(to: GitHubUserMoyaModel.self)
    }
}
