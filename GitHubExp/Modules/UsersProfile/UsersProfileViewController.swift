//
//  UsersProfileViewController.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import UIKit
import Moviper

class UsersProfileViewController: BaseRxViewController, UsersProfileContractView {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func createPresenters() -> [ViperRxPresenter] {
        return [UsersProfilePresenter<UsersProfileInteractor, UsersProfileRouting, UsersProfileViewController>()]
    }
}
