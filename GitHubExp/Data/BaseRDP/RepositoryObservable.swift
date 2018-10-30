//
//  RepositoryObservable.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import RxSwift

enum RDPError: Error {
    case noElements
}

public protocol RepositoryObservable {
    associatedtype EntityType
    
    func clear() -> Completable
    func add(item: EntityType) -> Completable
    func add(items: [EntityType]) -> Completable
    func update(item: EntityType) -> Completable
    func remove(item: EntityType) -> Completable
    func remove(items: [EntityType]) -> Completable
    func query(specification: Specification) -> Observable<[EntityType]>
    func first(specification: Specification) -> Observable<EntityType>
}

extension RepositoryObservable {
    func clear() -> Completable { fatalError() }
    func add(item: EntityType) -> Completable { fatalError() }
    func add(items: [EntityType]) -> Completable { fatalError() }
    func update(item: EntityType) -> Completable { fatalError() }
    func remove(item: EntityType) -> Completable { fatalError() }
    func remove(items: [EntityType]) -> Completable { fatalError() }
    func query(specification: Specification) -> Observable<[EntityType]> { fatalError() }
    func first(specification: Specification) -> Observable<EntityType> {
        return query(specification: specification)
            .flatMap({ entities -> Observable<EntityType> in
                if let entity = entities.first {
                    return Observable.just(entity)
                } else {
                    return Observable.error(RDPError.noElements)
                }
            })
    }
}

class AnyRepository<T>: RepositoryObservable {
    typealias EntityType = T
    
    private let _add: ((T) -> Completable)
    private let _addItems: (([T]) -> Completable)
    private let _remove: ((T) -> Completable)
    private let _removeItems: (([T]) -> Completable)
    private let _update: ((T) -> Completable)
    private let _clear: (() -> Completable)
    private let _query: ((Specification) -> Observable<[T]>)
    private let _first: ((Specification) -> Observable<T>)
    
    init<U: RepositoryObservable>(entityType: U) where U.EntityType == T {
        _add = entityType.add
        _addItems = entityType.add
        _remove = entityType.remove
        _removeItems = entityType.remove
        _update = entityType.update
        _clear = entityType.clear
        _query = entityType.query
        _first = entityType.first
    }
    
    func clear() -> Completable {
        return _clear()
    }
    
    func add(items: [T]) -> Completable {
        return _addItems(items)
    }
    
    func add(item: T) -> Completable {
        return _add(item)
    }
    func update(item: T) -> Completable {
        return _update(item)
    }
    
    func remove(item: T) -> Completable {
        return _remove(item)
    }
    
    func remove(items: [T]) -> Completable {
        return _removeItems(items)
    }
    
    func query(specification: Specification) -> Observable<[T]> {
        return _query(specification)
    }
    
    func first(specification: Specification) -> Observable<T> {
        return _first(specification)
    }
}
