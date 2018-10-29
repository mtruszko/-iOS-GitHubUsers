//
//  UsersProfilePresenter.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruzko. All rights reserved.
//

import UIKit

class UsersProfilePresenter
     <InteractorType: UsersProfileContractInteractor, RoutingType: UsersProfileContractRouting, ViewType: UsersProfileContractView>
    : BaseRxPresenter<InteractorType, RoutingType, ViewType> {

    override func attach(viperView: ViperRxView) {
        super.attach(viperView: viperView)
    }

    override func createRouting() -> RoutingType {
        return UsersProfileRouting() as! RoutingType
    }

    override func createInteractor() -> InteractorType {
        return UsersProfileInteractor() as! InteractorType
    }
}
