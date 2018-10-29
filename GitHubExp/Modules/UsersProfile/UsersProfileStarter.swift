//
//  UsersProfileStarter.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruzko. All rights reserved.
//

import UIKit

class UsersProfileStarter: BaseStarter<UsersProfileViewController> {
    override func startOn(viperView: ViperNavigator,
                          animated: Bool = true,
                          configurationBlock: ((UsersProfileViewController) -> ())? = nil) {
        let aUsersProfileViewController = UIViewController.getUsersProfileViewController()
        configurationBlock?(aUsersProfileViewController)
        //viperView.presentOnTopView(destinationViewController: aUsersProfileViewController, animated: animated)
    }
}

extension UIViewController {
    static func getUsersProfileViewController() -> UsersProfileViewController {
        return UIStoryboard.getUsersProfileStoryboard()
            .instantiateInitialViewController() as! UsersProfileViewController
    }
}

extension UIStoryboard {
    static func getUsersProfileStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "UsersProfile", bundle: nil)
    }
}
