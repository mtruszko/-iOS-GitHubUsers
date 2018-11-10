//
//  IPCUsersList.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import RxSwift
import Moviper
import Foundation

extension ObservableType where E == () {
    func ipcRefreshList() -> Observable<E> {
        return self.flatMap { event in
            Moviper.sharedInstance
                .getPresenterInstance(
                    presenterType: UserListPresenterType.self)
                .asObservable()
                .map { presenter -> (E, UserListPresenterType) in
                    (event, presenter)
                }
                .do(onNext: { _, presenter in
                    presenter.refreshList()
                })
                .map{ $0.0 }
        }
    }
}
