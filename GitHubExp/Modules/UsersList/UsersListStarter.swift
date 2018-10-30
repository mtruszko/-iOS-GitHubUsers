//
//  UsersListStarter.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruzko. All rights reserved.
//

import UIKit
import Moviper

class UsersListStarter: BaseStarter<UsersListViewController> {
    override func startOn(viperView: ViperNavigator,
                          animated: Bool = true,
                          configurationBlock: ((UsersListViewController) -> ())? = nil) {
        let aUsersListViewController = UIViewController.getUsersListViewController()
        configurationBlock?(aUsersListViewController)
        //viperView.presentOnTopView(destinationViewController: aUsersListViewController, animated: animated)
    }
}

extension UIViewController {
    static func getUsersListViewController() -> UsersListViewController {
        return UIStoryboard.getUsersListStoryboard()
            .instantiateInitialViewController() as! UsersListViewController
    }
}

extension UIStoryboard {
    static func getUsersListStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "UsersList", bundle: nil)
    }
}
