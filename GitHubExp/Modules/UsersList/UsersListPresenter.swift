//
//  UsersListPresenter.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import UIKit
import Moviper
import RxSwift

typealias UserListPresenterType =
    UsersListPresenter<
    UsersListInteractor,
    UsersListRouting,
    UsersListViewController>

class UsersListPresenter
    <InteractorType: UsersListContractInteractor, RoutingType: UsersListContractRouting, ViewType: UsersListContractView>
: BaseRxPresenter<InteractorType, RoutingType, ViewType> {
    
    var refreshSubject: PublishSubject<()> = PublishSubject<()>()
    
    override func attach(viperView: ViperRxView) {
        super.attach(viperView: viperView)
        
        addSubscription(subscription:
            refreshSubject
                .asObservable()
                .do(onNext: { _ in
                    self.view?.showLoading()
                })
                .observeOn(workScheduler)
                .flatMap { _ -> Observable<[GitHubUser]> in
                    self.interactor
                        .getGitHubUsers()
                }
                .observeOn(mainScheduler)
                .do(onError: { error in
                    self.view?.show(error: error)
                })
                .retry()
                .subscribe(onNext: { gitHubUsers in
                    self.view?.show(githubUsers: gitHubUsers)
                })
        )
        
        addSubscription(subscription:
            view?.pullToRefreshObservable
                .bind(to: refreshSubject)
        )
        
        addSubscription(subscription:
            view?.selectedUser
                .asObservable()
                .do(onNext: { gitHubUser in
                    self.routing.startUserProfile(gitHubUser: gitHubUser)
                })
                .subscribe()
        )
        
        refreshList()
    }
    
    func refreshList() {
        refreshSubject.onNext(())
    }
    
    override func createRouting() -> RoutingType {
        return UsersListRouting() as! RoutingType
    }
    
    override func createInteractor() -> InteractorType {
        return UsersListInteractor() as! InteractorType
    }
}
