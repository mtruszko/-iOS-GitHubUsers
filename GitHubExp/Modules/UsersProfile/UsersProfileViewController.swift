//
//  UsersProfileViewController.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import UIKit
import Moviper
import Kingfisher

class UsersProfileViewController: BaseRxViewController, UsersProfileContractView {
    
    var gitHubUser: GitHubUser?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let gitHubUser = gitHubUser else {
            return
        }
        
        loginLabel.text = gitHubUser.login
        avatarImageView.kf.setImage(with: URL(string: gitHubUser.avatarUrl))
    }

    override func createPresenters() -> [ViperRxPresenter] {
        return [UsersProfilePresenter<UsersProfileInteractor, UsersProfileRouting, UsersProfileViewController>()]
    }
}
