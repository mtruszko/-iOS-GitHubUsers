//
//  UsersListRoutingTests.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import XCTest
@testable import GitHubExp

final class UsersListRouterTests: XCTestCase {

    fileprivate var routing: UsersListRouting?

	override func setUp() {
		super.setUp()

		routing = UsersListRouting()
    }

    override func tearDown() {
        super.tearDown()
    }
}
