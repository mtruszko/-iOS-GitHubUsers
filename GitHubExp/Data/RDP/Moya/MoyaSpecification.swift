//
//  MoyaSpecification.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import Moya
import RxSwift

class MoyaSpecification<API: TargetType, Result>: Specification {
    func getResults(_ moyaProvider: MoyaProvider<API>) -> Single<Result> {
        fatalError()
    }
}
