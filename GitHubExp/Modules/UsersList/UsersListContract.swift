//
//  UsersListContract.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import Moviper
import RxSwift

protocol UsersListContractRouting: ViperRxRouting {
    func startUserProfile()
}

protocol UsersListContractInteractor: ViperRxInteractor {
    func getGitHubUsers() -> Observable<[GitHubUser]>
}

protocol UsersListContractView: ViperRxView {
    func show(githubUsers: [GitHubUser])
    func show(error: Error)
}
