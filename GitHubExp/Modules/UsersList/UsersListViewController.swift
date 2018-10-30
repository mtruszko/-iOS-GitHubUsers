//
//  UsersListViewController.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruzko. All rights reserved.
//

import UIKit
import Moviper

class UsersListViewController: BaseRxViewController, UsersListContractView {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func createPresenters() -> [ViperRxPresenter] {
        return [UsersListPresenter<UsersListInteractor, UsersListRouting, UsersListViewController>()]
    }
}
