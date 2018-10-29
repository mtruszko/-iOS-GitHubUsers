//
//  UsersProfileViewController.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruzko. All rights reserved.
//

import UIKit

class UsersProfileViewController: BaseRxViewController, UsersProfileContractView {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func createPresenters() -> [ViperRxPresenter] {
        return [UsersProfilePresenter<UsersProfileInteractor, UsersProfileRouting, UsersProfileViewController>()]
    }
}
