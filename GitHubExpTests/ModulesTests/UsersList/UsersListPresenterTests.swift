//
//  UsersListPresenterTests.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import XCTest
@testable import GitHubExp

final class UsersListPresenterTest: XCTestCase {

    fileprivate var routing: MockUsersListRouting! = MockUsersListRouting()
    fileprivate var interactor: MockUsersListInteractor! = MockUsersListInteractor()
    fileprivate var view: MockUsersListViewController! = MockUsersListViewController()

    fileprivate var presenter: UsersListPresenter<MockUsersListInteractor, MockUsersListRouting, MockUsersListViewController>!

    override func setUp() {
        super.setUp()

        presenter = UsersListPresenter(routing: routing, interactor: interactor)
        presenter.attach(viperView: view)
    }

    override func tearDown() {
        super.tearDown()
    }
}
