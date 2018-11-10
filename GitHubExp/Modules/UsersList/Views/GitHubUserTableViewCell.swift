//
//  GitHubUserTableViewCell.swift
//  GitHubExp
//
//  Created by marek on 08/11/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import UIKit
import Kingfisher

class GitHubUserTableViewCell: UITableViewCell {
    
    static let kNibName = "GitHubUserTableViewCell"
    static let kCellIdentifier = "gitHubUserCellIdentifier"
    
    static func registerCellIn(tableView: UITableView) {
        tableView.register(UINib(nibName: kNibName, bundle: nil), forCellReuseIdentifier: kCellIdentifier)
    }
    
    var gitHubUser: GitHubUser?

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!

    func bind(_ gitHubUser: GitHubUser) {
        self.gitHubUser = gitHubUser
        loginLabel.text = gitHubUser.login
        let processor = RoundCornerImageProcessor(cornerRadius: 40)
        avatarImageView.kf.setImage(with: URL(string: gitHubUser.avatarUrl), options:[.processor(processor)])
    }
}
