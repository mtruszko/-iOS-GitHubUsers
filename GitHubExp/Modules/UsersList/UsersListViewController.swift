//
//  UsersListViewController.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import UIKit
import Moviper

class UsersListViewController: BaseRxViewController, UsersListContractView {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func show(githubUsers: [GitHubUser]) {
        
    }
    
    func show(error: Error) {
        
    }

    override func createPresenters() -> [ViperRxPresenter] {
        return [UsersListPresenter<UsersListInteractor, UsersListRouting, UsersListViewController>()]
    }
}
