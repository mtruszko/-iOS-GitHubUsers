//
//  UsersProfileStarter.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import UIKit
import Moviper

class UsersProfileStarter: BaseStarter<UsersProfileViewController> {    
    override func startOn(viperView: ViperNavigator,
                          animated: Bool = true,
                          configurationBlock: ((UsersProfileViewController) -> ())? = nil) {
        let aUsersProfileViewController = UIViewController.getUsersProfileViewController()
        configurationBlock?(aUsersProfileViewController)
        viperView.push(destinationViewController: aUsersProfileViewController,
                       animated: true)
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
