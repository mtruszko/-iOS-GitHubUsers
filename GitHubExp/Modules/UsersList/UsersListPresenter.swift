//
//  UsersListPresenter.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import UIKit
import Moviper

typealias UserListPresenterType =
    UsersListPresenter<
    UsersListInteractor,
    UsersListRouting,
    UsersListViewController>

class UsersListPresenter
    <InteractorType: UsersListContractInteractor, RoutingType: UsersListContractRouting, ViewType: UsersListContractView>
: BaseRxPresenter<InteractorType, RoutingType, ViewType> {
    
    override func attach(viperView: ViperRxView) {
        super.attach(viperView: viperView)
        
        addSubscription(subscription:
            interactor.getGitHubUsers()
                .subscribe(onNext: { gitHubUsers in
                    self.view?.show(githubUsers: gitHubUsers)
                }, onError: { error in
                    self.view?.show(error: error)
                })
        )
    }
    
    func refreshList() {
        
    }
    
    override func createRouting() -> RoutingType {
        return UsersListRouting() as! RoutingType
    }
    
    override func createInteractor() -> InteractorType {
        return UsersListInteractor() as! InteractorType
    }
}
