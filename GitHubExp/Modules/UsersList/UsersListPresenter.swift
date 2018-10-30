//
//  UsersListPresenter.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruzko. All rights reserved.
//

import UIKit
import Moviper

class UsersListPresenter
     <InteractorType: UsersListContractInteractor, RoutingType: UsersListContractRouting, ViewType: UsersListContractView>
    : BaseRxPresenter<InteractorType, RoutingType, ViewType> {

    override func attach(viperView: ViperRxView) {
        super.attach(viperView: viperView)
    }

    override func createRouting() -> RoutingType {
        return UsersListRouting() as! RoutingType
    }

    override func createInteractor() -> InteractorType {
        return UsersListInteractor() as! InteractorType
    }
}
