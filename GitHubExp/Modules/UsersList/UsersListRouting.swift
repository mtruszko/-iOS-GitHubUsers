//
//  UsersListRouting.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import UIKit
import Moviper

class UsersListRouting: BaseRxRouting, UsersListContractRouting {
    
    let usersProfileStarter: UsersProfileStarter = UsersProfileStarter()
    
    func startUserProfile(gitHubUser: GitHubUser) {
        if let vc = viewController {
            usersProfileStarter.startOn(viperView: vc,
                                        animated: true)
            { usersProfileViewController in
                usersProfileViewController.gitHubUser = gitHubUser
            }
        }
    }
}
