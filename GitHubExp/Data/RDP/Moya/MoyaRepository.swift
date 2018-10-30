//
//  MoyaRepository.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import Moya
import RxSwift

class MoyaRepository<EntityClass, MayaAPIClass: TargetType>: RepositoryObservable {
    typealias EntityType = EntityClass
    
    let moyaProvider: MoyaProvider<MayaAPIClass> = MoyaProvider()
    
    func query(specification: Specification) -> Observable<[EntityClass]> {
        fatalError()
    }
}
