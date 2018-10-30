//
//  UsersProfilePresenterTests.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import XCTest
@testable import GitHubExp

final class UsersProfilePresenterTest: XCTestCase {

    fileprivate var routing: MockUsersProfileRouting! = MockUsersProfileRouting()
    fileprivate var interactor: MockUsersProfileInteractor! = MockUsersProfileInteractor()
    fileprivate var view: MockUsersProfileViewController! = MockUsersProfileViewController()

    fileprivate var presenter: UsersProfilePresenter<MockUsersProfileInteractor, MockUsersProfileRouting, MockUsersProfileViewController>!

    override func setUp() {
        super.setUp()

        presenter = UsersProfilePresenter(routing: routing, interactor: interactor)
        presenter.attach(viperView: view)
    }

    override func tearDown() {
        super.tearDown()
    }
}
